#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const os = require('os');

// Installation script for npm-based installation
class SDDSkillInstaller {
    constructor() {
        this.homeDir = os.homedir();
        this.claudeDir = path.join(this.homeDir, '.claude');
        this.skillsDir = path.join(this.claudeDir, 'skills');
        this.installDir = path.join(this.skillsDir, 'sdd');
        this.packageDir = __dirname;
        this.version = '1.0.0';
    }

    async install() {
        console.log('🚀 Installing SDD Skill for Claude Code...');
        console.log(`📁 Target directory: ${this.installDir}`);

        try {
            // Create directories
            await this.createDirectories();

            // Copy files
            await this.copySkillFiles();

            // Set permissions
            await this.setPermissions();

            // Update Claude Code settings
            await this.updateSettings();

            // Create environment variables
            await this.setupEnvironment();

            // Verify installation
            await this.verifyInstallation();

            console.log('✅ SDD Skill installed successfully!');
            console.log('');
            console.log('🚀 Next steps:');
            console.log('1. Restart Claude Code or reload your session');
            console.log('2. Test with: /sdd.constitution Create principles for quality code');
            console.log('3. Check documentation: https://github.com/your-org/sdd-claude-code-skill');

        } catch (error) {
            console.error('❌ Installation failed:', error.message);
            process.exit(1);
        }
    }

    async createDirectories() {
        console.log('📁 Creating directories...');

        await fs.promises.mkdir(this.claudeDir, { recursive: true });
        await fs.promises.mkdir(this.skillsDir, { recursive: true });
        await fs.promises.mkdir(this.installDir, { recursive: true });

        console.log('✅ Directories created');
    }

    async copySkillFiles() {
        console.log('📋 Copying skill files...');

        const filesToCopy = [
            'SDD.md',
            'README.md',
            'package.json',
            'GLOBAL_INSTALL.md',
            '.specify/',
            'scripts/',
            'templates/'
        ];

        for (const file of filesToCopy) {
            const sourcePath = path.join(this.packageDir, file);
            const targetPath = path.join(this.installDir, file);

            if (fs.existsSync(sourcePath)) {
                await this.copyRecursive(sourcePath, targetPath);
                console.log(`   ✅ ${file}`);
            }
        }
    }

    async copyRecursive(source, target) {
        const stat = await fs.promises.stat(source);

        if (stat.isDirectory()) {
            await fs.promises.mkdir(target, { recursive: true });
            const items = await fs.promises.readdir(source);

            for (const item of items) {
                await this.copyRecursive(
                    path.join(source, item),
                    path.join(target, item)
                );
            }
        } else {
            await fs.promises.copyFile(source, target);
        }
    }

    async setPermissions() {
        console.log('🔧 Setting permissions...');

        const scriptsDir = path.join(this.installDir, 'scripts', 'bash');
        if (fs.existsSync(scriptsDir)) {
            const scripts = await fs.promises.readdir(scriptsDir);

            for (const script of scripts) {
                const scriptPath = path.join(scriptsDir, script);
                await fs.promises.chmod(scriptPath, '755');
            }
        }

        console.log('✅ Permissions set');
    }

    async updateSettings() {
        console.log('⚙️  Configuring Claude Code...');

        const settingsPath = path.join(this.claudeDir, 'settings.json');
        let settings = {};

        // Load existing settings
        if (fs.existsSync(settingsPath)) {
            const content = await fs.promises.readFile(settingsPath, 'utf8');
            try {
                settings = JSON.parse(content);
            } catch (error) {
                console.warn('⚠️  Could not parse existing settings, creating new ones');
            }
        }

        // Update with SDD skill configuration
        if (!settings.skills) {
            settings.skills = {};
        }

        settings.skills.sdd = {
            enabled: true,
            path: this.installDir,
            version: this.version,
            auto_update: true,
            last_check: new Date().toISOString(),
            installed_via: 'npm'
        };

        // Write updated settings
        await fs.promises.writeFile(settingsPath, JSON.stringify(settings, null, 2));

        console.log('✅ Claude Code settings updated');
    }

    async setupEnvironment() {
        console.log('🌍 Setting up environment...');

        const shellRC = this.getShellRC();

        if (fs.existsSync(shellRC)) {
            const content = await fs.promises.readFile(shellRC, 'utf8');

            if (!content.includes('SDD_SKILL_HOME')) {
                const envVars = '\n\n# SDD Skill for Claude Code\nexport SDD_SKILL_HOME="$HOME/.claude/skills/sdd"\nexport SDD_GLOBAL_ENABLED=true\n';

                await fs.promises.appendFile(shellRC, envVars);
                console.log('✅ Environment variables added');
            } else {
                console.log('ℹ️  Environment variables already exist');
            }
        }
    }

    getShellRC() {
        const shell = process.env.SHELL || '';

        if (shell.includes('zsh')) {
            return path.join(this.homeDir, '.zshrc');
        } else if (shell.includes('bash')) {
            return path.join(this.homeDir, '.bashrc');
        } else {
            return path.join(this.homeDir, '.profile');
        }
    }

    async verifyInstallation() {
        console.log('🧪 Verifying installation...');

        const specScript = path.join(this.installDir, 'scripts', 'bash', 'create-new-feature.sh');

        if (fs.existsSync(specScript)) {
            console.log('✅ Installation verified');
        } else {
            throw new Error('Installation verification failed - scripts not found');
        }
    }
}

// Run installation
if (require.main === module) {
    const installer = new SDDSkillInstaller();
    installer.install().catch(console.error);
}

module.exports = SDDSkillInstaller;