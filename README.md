# OpenCode Agents

<p align="center">
  <img src="https://raw.githubusercontent.com/veschin/opencode-agents/main/logo.svg" width="128" alt="OpenCode Agents Logo">
</p>

<p align="center">
  <em>"Репозиторий с .md-файлами... но каждый файл — это персональность."</em>
</p>

---

## Установка

**Linux/macOS:**

```bash
# Создаём директорию агентов
mkdir -p ~/.config/opencode/agent/

# Загружаем все .md файлы через GitHub API
curl -s "https://api.github.com/repos/veschin/opencode-agents/contents" | \
  jq -r '.[] | select(.name | endswith(".md")) | .download_url' | \
  while read url; do curl -s "$url" -o ~/.config/opencode/agent/$(basename "$url"); done
```

*Требуется jq для обработки JSON. Установите через `sudo apt install jq` (Ubuntu/Debian), `brew install jq` (macOS), или `pacman -S jq` (Arch).*

**Windows (PowerShell):**

```powershell
# Создаём директорию агентов
$agentDir = Join-Path $env:USERPROFILE ".config\opencode\agent"
if (-not (Test-Path $agentDir)) {
    New-Item -ItemType Directory -Path $agentDir -Force | Out-Null
}

# Загружаем все .md файлы через GitHub API
Invoke-RestMethod -Uri "https://api.github.com/repos/veschin/opencode-agents/contents" |
    Where-Object { $_.name -like '*.md' } |
    ForEach-Object {
        $content = Invoke-RestMethod -Uri $_.download_url
        $path = Join-Path $agentDir $_.name
        $content | Out-File -FilePath $path -Encoding UTF8
    }
```

## _arch — Senior Solution Architect

Сеньор-архитектор, который смотрит на задачу как на набор вопросов. Не даёт сроки, оценивает сложность по четырём фреймворкам и разрезает проект на фазы с нулевым простоем.

Подходит к любой задаче через **Bare Minimum Filter**: каждый элемент проекта проверяется на критичность. Если что-то не жизненно важно для MVP — не попадает в первую фазу. Если можно сделать позже — делается позже. Если не требует архитектурного решения сейчас — переносится.

Разделяет проекты на размеры по T-shirt: от XS (простой CRUD с валидацией) до XL (полный редизайн домена с требованиями масштабируемости). Для каждого размера — своя глубина проработки, свои Use Case Points, свои факторы окружения.

Когда проект разбит на фазы, выдаёт JIRA-задачи с чётким форматом: приоритет, стори-пойнты, стратегия отката, нулевой простой, метрики мониторинга. Деплой — не просто "задеплоить", а выбор из шести стратегий: feature flags, canary rollout, blue-green, shadow mode, strangler pattern или dark launch.

## _beagle — Virtual Hunting Dog Researcher

Получает запрос и следует за информационными трейлами: раскрывает связанные темы, находит синонимы, углубляется в смежные области. Расширяет круг поиска постепенно, каждый новый найденный факт ведёт к следующему запросу.

Работает тихо. Не показывает промежуточные отчёты, не сообщает о прогрессе. Каждое утверждение обязательно подкреплено источником в формате `[N]`.

Внутри своего мышления декодирует запросы на экспертный язык, затем ветвит поиск: находит определения, применения, сравнения технологий. Построив карту связей между терминами, проверяет факты по разным источникам и собирает полную картину.

Выдаёт три вещи. Основной вывод — краткий ответ на запрос с рекомендациями. Карту связей — дерево, где термины ведут к концепциям, концепции к технологиям, технологии к применениям. И оценку уверенности: High, Medium или Low. Отвечает всегда на русском, хотя вся внутренняя обработка проходит на английском.

## _writer — Maximally Creative Agent

Писатель с нарративной системой. Перед написанием каждого предложения проходит через шесть фаз мышления, где определяет, зачем текст существует, какой путь пройдёт читатель, где возникнут вопросы и где наступит инсайт.

Вывод всегда на языке запроса, мышление — на английском. Итог читается как написанное вдумчивым человеком.
