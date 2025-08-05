# Course Website Management Guide

This guide serves as a reference for managing the Data Science course website. It covers how content is organized and how different components work together.

## Table of Contents

1. [File Organization](#file-organization)
2. [Adding New Content](#adding-new-content)
3. [Content Types](#content-types)
4. [Special Features](#special-features)

## Key Files and Their Relationships

The website content is interconnected through several key files:

```
data/
├── schedule.yaml    # Master schedule file - controls course timeline
└── files.yaml      # List of available data files
content/
├── weeks/          # Weekly lecture materials (just to fetch layout)
├── homeworks/      # Homework assignments
└── problemsets/    # Problem sets
static/
└── data/          # Data files used in assignments to download
```

### Schedule Management (schedule.yaml)

The `data/schedule.yaml` file controls what appears on the course website. When adding new content:

1. Add week entries to `data/schedule.yaml`:

```yaml
- title: "Introduction"
    goal: "Scientific method, camps of analysis"
    weeknum: 1
    date: 2025-08-25
    week: "01-intro"

    materials:
      assignment:
        name: "PS0"
        link: "psc4175_pset_0/"
        due: 2025-09-07

      homework:
        link: "psc4175_hw_1/"
        extra: "If some other task"

      slides:
        - name: "Lecture 1 - Introduction"
          link: "1_intro.html"

      video:
        - name: "PSC 4175 - Lecture 1 - Introduction"
          url: "Ug166moDRls"
```

2. Create matching week file in `content/weeks/` with same `week_id`.
   Make sure `type: weeks` is there on the created file.

```
---
title: "Introduction"
linktitle: "1: Introduction"
week_id: "01-intro"

date: 2025-08-25
menu:
  weeks:
    parent: Weeks
    weight: 1
type: weeks
---
```

3. Add assignments to the appropriate week in `data/schedule.yaml`
4. Content only appears when properly referenced in `data/schedule.yaml`

### Data Files Management

When adding new data files:

1. Place the file in `static/data/`
2. Either:
   - Run `R/files.R` to automatically update listings,
   ### OR
   - Add filename manually to `data/files.yaml`:

```yaml
files:
  - "dataset1.rds"
  - "dataset2.csv"
```

## Adding New Content

### General Steps for All Content

1. Create a new .Rmd file in the appropriate directory
2. Include the required YAML front matter
3. Add your content using R Markdown
4. Build the site using blogdown to generate the HTML

### Required YAML Front Matter

Different content types require different YAML headers. Here are the standard formats:

#### For Homeworks:

Make sure `type: homeworks` is there on the crated file. Otherwise, there'll be no download option.

```yaml
---
title: "Intro to Data Science"
author: "Prof. Weldzius"
date: 2025-07-24
Due_Date: "2026-06-02 by 11:59PM"
output:
  html_document: default
  pdf_document: default
subtitle: What R we doing?
institute: Villanova University
type: homeworks
---
```

#### For Problem Sets:

Make sure `type: homeworks` is there on the created file.

```yaml
---
title: "Problem Set 0"
subtitle: "Practice (not graded)"
author: "[YOUR NAME]"
institute: "Villanova University"
date: 2025-05-30
Due_Date: "2025-06-06 by 11:59 PM"
type: homeworks
---
```

## Content Types

### 1. Homeworks

- Location: `content/homeworks/`
- Naming convention: `psc4175_hw_X.Rmd`

### 2. Problem Sets

- Location: `content/problemsets/`
- Naming convention: `psc4175_pset_X.Rmd`

### 3. Weekly Lectures

- Location: `content/weeks/`
- Naming convention: `XX-topic.Rmd`

### 4. Lecture Slides

- Location: `static/lectures/`
- Naming convention: No particular choice, but file should be `html slide` like previously, and shouldn't alter the alrady exsisting `css/` contents.

## Special Features

### Adding Data Files

1. Place data files in the `static/data/` directory
2. Reference them in R Markdown using relative paths:

```r
df <- read_rds('../../data/filename.Rds')
```

### Including Images

1. Place images in `static/images/` or `static/lectures/figs/`
2. Reference them in R Markdown:

```markdown
![Alt text](../../lectures/figs/image.png)
```
