# Evaluation Framework

## Apžvalga
Šis framework'as skirtas sistematiškai vertinti workspace kokybę, automatizacijos efektyvumą ir AI agentų veikimą.

## Struktūra

```
evaluation/
├── README.md           # Šis failas
├── run-evaluation.ps1  # Pagrindinis vertinimo skriptas
├── metrics/
│   ├── code-quality.ps1    # Kodo kokybės metrikos
│   ├── automation.ps1      # Automatizacijos efektyvumas
│   └── agent-performance.ps1 # AI agentų našumas
├── reports/            # Sugeneruoti raportai
└── benchmarks/         # Baziniai testai
```

## Naudojimas

```powershell
# Pilnas vertinimas
.\evaluation\run-evaluation.ps1

# Atskiri moduliai
.\evaluation\metrics\code-quality.ps1
.\evaluation\metrics\automation.ps1
.\evaluation\metrics\agent-performance.ps1
```

## Metrikos

### 1. Kodo kokybė
- Failų skaičius ir tipai
- Dokumentacijos apimtis
- TODO užbaigtumo lygis

### 2. Automatizacijos efektyvumas
- Skriptų skaičius ir būsena
- GitHub integracija
- Pipeline veikimas

### 3. AI agentų našumas
- Knowledge-base užpildymas
- Užduočių delegavimo efektyvumas
- Sesijų istorija

## Rezultatų interpretacija
- **A (90-100%)**: Puiki būsena
- **B (75-89%)**: Gera būsena, nedideli patobulinimai
- **C (60-74%)**: Vidutinė būsena, reikia dėmesio
- **D (<60%)**: Kritinė būsena, skubus veiksmas
