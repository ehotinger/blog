---
title: "Bypassing the character limit displayed when debugging with Delve and VSCode"
date: 2019-02-25T00:00:00-07:00
author: "Eric Hotinger"
description: "This blog post provides a guide to customize your workspace or user settings in Visual Studio Code for debugging Go applications with Delve. By default, values of long variables are truncated to 64 characters with ...+7 more displayed. To avoid this limitation, the maxStringLen setting can be adjusted in the go.delveConfig JSON. This configuration can be found in the user or workspace settings by using the keyboard shortcut CTRL + SHIFT + P and searching for settings. Be mindful that tweaking the settings can affect performance, but this guide and linked resources provide information on the various options available for configuration."

tags:
- development
- Go
- software

categories:
- development
- software
- Go

slug: vscode-delve-debugging
---

Debugging Go applications with Visual Studio Code and Delve is extremely powerful. However, there are some default settings which you may want to tweak to improve this experience and they're not straightforward to find out.

Sometimes when you're debugging if a variable's value is really long, i.e. more than 64 characters, you'll see the value's content end as "...+7 more" or however many characters were truncated. To get around this, you need to customize your workspace or user settings in Visual Studio Code.

Open your user settings or workspace settings (CTRL + SHIFT + P) => type settings and choose one from the dropdown list. Then, check out this JSON for various settings you can configure. The `maxStringLen` setting is the one you care about the most. Note that depending on these settings you can cause serious perf gain/loss, so tinker with them.

```json
{
    "go.delveConfig": {
        "useApiV1": false,
        "dlvLoadConfig": {
            "followPointers": true,
            "maxVariableRecurse": 3,
            "maxStringLen": 300,
            "maxArrayValues": 64,
            "maxStructFields": -1
        }
    }
}
```

[Here is the source code](https://github.com/Microsoft/vscode-go/blob/master/src/goDebugConfiguration.ts) for the related configuration loading.

And there's some [useful discussion here](https://github.com/Microsoft/vscode-go/issues/1555#issuecomment-393366905) before the feature was added.