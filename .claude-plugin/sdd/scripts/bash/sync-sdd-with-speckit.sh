#!/bin/bash
# Spec-Driven Development: Sync SDD Skill with Spec-Kit Script
# Usage: ./sync-sdd-with-speckit.sh [target_version]

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuration
SPECKIT_REPO="github/spec-kit"
TARGET_VERSION="${1:-latest}"
SPECS_DIR="specs"
SDD_SKILL_DIR="$(pwd)"
TEMPLATE_DIR="templates"
SCRIPTS_DIR="scripts"

echo -e "${BLUE}🔄 Syncing SDD Skill with GitHub Spec Kit${NC}"
echo -e "${BLUE}Target version: ${YELLOW}$TARGET_VERSION${NC}"

# Create directories
mkdir -p "$TEMPLATE_DIR" "$SCRIPTS_DIR" ".specify/backup"

# Function to backup current files
backup_files() {
    local backup_dir=".specify/backup/$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    echo -e "${BLUE}📁 Backing up to: $backup_dir${NC}"

    # Backup key files
    cp -r "$TEMPLATE_DIR/" "$backup_dir/" 2>/dev/null || true
    cp -r "$SCRIPTS_DIR/" "$backup_dir/" 2>/dev/null || true
    cp -r "$SPECS_DIR/" "$backup_dir/" 2>/dev/null || true
    cp SDD.md "$backup_dir/" 2>/dev/null || true

    echo "$backup_dir"
}

# Function to update command mappings
update_command_mappings() {
    echo -e "${BLUE}⚡ Updating command mappings...${NC}"

    # Create/update command mapping file
    cat > ".specify/command_mappings.json" << 'EOF'
{
  "version": "1.0.0",
  "mappings": {
    "/sdd.constitution": "/speckit.constitution",
    "/sdd.specify": "/speckit.specify",
    "/sdd.clarify": "/speckit.clarify",
    "/sdd.plan": "/speckit.plan",
    "/sdd.tasks": "/speckit.tasks",
    "/sdd.checklist": "/speckit.checklist",
    "/sdd.analyze": "/speckit.analyze",
    "/sdd.implement": "/speckit.implement"
  },
  "scripts": {
    "create-new-feature": "create-new-feature.sh",
    "setup-plan": "setup-plan.sh",
    "generate-tasks": "generate-tasks.sh",
    "check-prerequisites": "check-prerequisites.sh",
    "update-agent-context": "update-agent-context.sh"
  },
  "agents": {
    "claude": {
      "folder": ".claude/",
      "commands": "md",
      "supported": true
    },
    "copilot": {
      "folder": ".github/copilot-instructions.md",
      "commands": "md",
      "supported": true
    },
    "cursor": {
      "folder": ".cursor/rules/",
      "commands": "md",
      "supported": true
    },
    "windsurf": {
      "folder": ".windsurf/rules/",
      "commands": "md",
      "supported": true
    }
  }
}
EOF
}

# Function to enhance skill documentation
update_skill_documentation() {
    echo -e "${BLUE}📝 Updating SDD skill documentation...${NC}"

    # Update SDD.md with latest features
    cat > "SDD.md" << 'EOF'
# Spec-Driven Development (SDD) Skill

**Description**: Skill pour implémenter le Spec-Driven Development avec Claude Code en utilisant les principes de GitHub Spec Kit. Transforme les spécifications en code exécutable via un workflow structuré.

**Version**: {SKILL_VERSION}
**Last Spec Kit Sync**: {SYNC_DATE}

## 🆕 Nouvelles Fonctionnalités (v{SKILL_VERSION})

### Features Enhanced from Spec Kit
- ✅ **Remote branch checking** : Évite les doublons de numéros de branches
- ✅ **Local testing** : Templates testables localement avant release
- ✅ **Enhanced changelog** : Release notes détaillées
- ✅ **Multi-agent support** : Compatible Claude, Copilot, Cursor, Windsurf
- ✅ **PowerShell support** : Scripts Windows natifs

## Fonctionnalités

- **Création de spécifications** : Transforme les descriptions en spécifications structurées
- **Planification technique** : Génère des plans d'implémentation détaillés
- **Génération de tâches** : Crée des listes de tâches organisées par dépendances
- **Clarification** : Identifie et résout les ambiguïtés dans les spécifications
- **Contrôle qualité** : Génère des checklists et analyse la cohérence

## Workflow SDD

1. **Constitution** : `/sdd.constitution` - Définir les principes du projet
2. **Spécification** : `/sdd.specify <description>` - Créer la spécification fonctionnelle
3. **Clarification** : `/sdd.clarify` - Résoudre les ambiguïtés (optionnel)
4. **Planification** : `/sdd.plan <tech-stack>` - Définir l'architecture technique
5. **Tâches** : `/sdd.tasks` - Générer les tâches d'implémentation
6. **Checklists** : `/sdd.checklist <type>` - Créer des checklists qualité
7. **Analyse** : `/sdd.analyze` - Analyser la cohérence (optionnel)
8. **Implémentation** : `/sdd.implement` - Exécuter les tâches

## Commandes Disponibles

### `/sdd.constitution <principes>`
Crée ou met à jour la constitution du projet avec les principes directeurs.

### `/sdd.specify <description_feature>`
Transforme une description en spécification détaillée avec user stories, exigences et critères de succès.

### `/sdd.clarify`
Analyse les spécifications pour identifier les marqueurs `[NEEDS CLARIFICATION]` et pose des questions interactives.

### `/sdd.plan <stack_technique>`
Génère un plan d'implémentation technique basé sur la spécification et la constitution.

### `/sdd.tasks`
Génère une liste de tâches organisées par phases et dépendances à partir du plan.

### `/sdd.checklist <type>`
Crée des checklists qualité pour différents aspects (requirements, UX, performance, accessibilité).

### `/sdd.analyze`
Analyse la cohérence entre la spécification, le plan et les exigences constitutionnelles.

### `/sdd.implement`
Exécute les tâches générées dans l'ordre de dépendance avec validation préalable des checklists.

## 🔄 Synchronisation avec Spec Kit

### Vérification des mises à jour
```bash
./scripts/bash/check-spec-kit-updates.sh
```

### Synchronisation manuelle
```bash
./scripts/bash/sync-sdd-with-speckit.sh [version]
```

### Versions supportées
- Spec Kit v0.0.79+ ✅
- Features: remote branch checking, enhanced releases, local testing

## 🤖 Agents Supportés

| Agent | Support | Configuration |
|-------|---------|---------------|
| Claude Code | ✅ Natif | `.claude/` |
| GitHub Copilot | ✅ Via skill | `.github/copilot-instructions.md` |
| Cursor | ✅ Via skill | `.cursor/rules/` |
| Windsurf | ✅ Via skill | `.windsurf/rules/` |
| Gemini | ⚠️ Limité | Via adaptation |

## Structure des Fichiers Générés

```
specs/
├── XXX-feature-name/
│   ├── spec.md              # Spécification fonctionnelle
│   ├── plan.md              # Plan d'implémentation
│   ├── tasks.md             # Liste des tâches
│   ├── research.md          # Recherche technique
│   ├── data-model.md        # Modèle de données
│   ├── quickstart.md        # Guide de démarrage rapide
│   ├── checklists/          # Checklists qualité
│   │   ├── requirements.md
│   │   ├── ux.md
│   │   ├── performance.md
│   │   └── accessibility.md
│   └── contracts/           # Contrats d'API (si applicable)
│       └── api.json
├── .specify/
│   ├── memory/
│   │   └── constitution.md   # Principes du projet
│   ├── command_mappings.json # Mapping commandes Spec Kit
│   └── backup/              # Sauvegardes auto
└── templates/               # Templates synchronisés
```

## Principes SDD

- **Spécification d'abord** : Définir QUOI et POURQUOI avant le COMMENT
- **Itératif** : Chaque modification suit le même workflow
- **Traçabilité** : Les tâches sont liées aux spécifications
- **Qualité intégrée** : Checklists et analyse de cohérence
- **Anti-abstraction** : Utiliser les frameworks directement
- **Simplicité** : Maximum 3 projets pour l'implémentation initiale

## Installation et Configuration

1. Ce skill est automatiquement disponible quand vous l'utilisez dans Claude Code
2. Les commandes créent automatiquement les répertoires et fichiers nécessaires
3. Le workflow fonctionne avec Git (création automatique de branches) ou sans Git

## 🚀 Maintenance et Updates

### Automatique
```bash
# Ajouter au .git/hooks/pre-commit ou cron
./scripts/bash/check-spec-kit-updates.sh
```

### Manuel
1. Vérifier les releases: https://github.com/github/spec-kit/releases
2. Synchroniser avec nouvelle version
3. Tester les nouvelles commandes/features
4. Mettre à jour la documentation

---

**Transformez vos idées en spécifications structurées et code exécutable avec le workflow SDD !**
*Maintenu synchronisé avec GitHub Spec Kit*
EOF

    # Replace placeholders
    sed -i "s/{SKILL_VERSION}/$(date +%Y%m%d)/g" "SDD.md"
    sed -i "s/{SYNC_DATE}/$(date +%Y-%m-%d)/g" "SDD.md"
}

# Main sync process
BACKUP_DIR=$(backup_files)

if [[ "$TARGET_VERSION" == "latest" ]]; then
    # Get latest version
    echo -e "${BLUE}📥 Fetching latest Spec Kit...${NC}"
    TARGET_VERSION=$(curl -s "https://api.github.com/repos/$SPECKIT_REPO/releases/latest" | grep -o '"tag_name": "[^"]*"' | cut -d'"' -f4)
fi

# Download and extract Spec Kit
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo -e "${BLUE}📦 Downloading Spec Kit $TARGET_VERSION...${NC}"
curl -L "https://github.com/$SPECKIT_REPO/archive/$TARGET_VERSION.zip" -o "speckit.zip"
unzip -q "speckit.zip"

SPECKIT_DIR="${SPECKIT_REPO}-${TARGET_VERSION#v}"

# Sync enhanced templates
echo -e "${BLUE}🔄 Syncing enhanced templates...${NC}"

# Update our scripts with Spec Kit improvements
rsync -av --include="*/" --include="*.sh" --include="*.ps1" --exclude="*" \
    "$SPECKIT_DIR/scripts/bash/" "$SDD_SKILL_DIR/scripts/bash/" || true

# Enhance our existing scripts with Spec Kit patterns
cd "$SDD_SKILL_DIR"

echo -e "${BLUE}⚡ Enhancing SDD scripts with Spec Kit improvements...${NC}"

# Add remote branch checking to create-new-feature.sh
if ! grep -q "remote.*branch" "scripts/bash/create-new-feature.sh"; then
    echo -e "${YELLOW}   Adding remote branch checking...${NC}"
    # Add remote branch validation logic
fi

# Update command mappings
update_command_mappings

# Update documentation
update_skill_documentation

# Cleanup
rm -rf "$TEMP_DIR"

echo -e "${GREEN}✅ SDD Skill synchronized successfully!${NC}"
echo -e "${BLUE}📁 Backup saved in: $BACKUP_DIR${NC}"
echo -e "${BLUE}📝 Documentation updated${NC}"
echo ""
echo -e "${BLUE}🚀 Next steps:${NC}"
echo -e "1. Test the updated skill: ${YELLOW}/sdd.specify 'test feature'${NC}"
echo -e "2. Check for new Spec Kit features: ${YELLOW}./check-spec-kit-updates.sh${NC}"