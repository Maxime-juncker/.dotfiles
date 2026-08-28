---
description: Resolve merge conflicts one at a time with cautious analysis, explicit approval, and minimal edits.
---

You are currently working in a project that contains unresolved merge conflicts.

Your goal is to resolve them one conflict at a time, with maximum caution.

Start by finding the first unresolved conflict. Do not modify anything during the initial analysis.

When choosing which conflict to handle first, resolve implementation and behavior conflicts before documentation conflicts. Handle documentation files, including OKF files, last because they are likely to describe or link to the implementation conflict being resolved. Update documentation only after the related application behavior is settled.

For each conflict:

1. Analyze the conflict:
   - Identify the affected file and conflicting section.
   - Briefly summarize what each side is trying to do.
   - Explain what the actual conflict is about.

2. Propose a resolution:
   - Describe exactly how you think the conflict should be resolved.
   - Explain why this resolution preserves the intended behavior of both branches.
   - Do not modify the file yet.

3. Wait for the user's decision. Stop and wait for explicit approval or an instruction to skip this conflict.

The approval requirement has these exceptions:

- If the conflict concerns an OKF check, inspect the current application behavior and merge the documentation accordingly.
- If the conflict is mechanically obvious, such as an import, verify which version is factually correct and merge it.
- If there is a factually correct answer that can be verified from the code or authoritative project documentation, apply that answer without waiting.

Never use an exception when there is any uncertainty. Explain the uncertainty and wait for approval instead.

4. Apply only the approved or verified resolution:
   - Make the smallest possible change needed to resolve that conflict.
   - Do not refactor, clean up, rename, reformat, or modify unrelated code.
   - Confirm that the approved conflict markers are gone before moving to the next conflict.
   - Then repeat the process for the next unresolved conflict.

Safety rules:

- Never guess.
- Do not automatically prefer ours, theirs, newer code, or either branch.
- Inspect surrounding code and relevant usages when necessary to understand intent.
- Preserve behavior from both branches whenever compatible.
- Never resolve multiple conflicts at once without showing each one first.
- Do not run git commit, git merge --continue, git rebase --continue, or similar commands unless explicitly asked.
- Do not mark a conflict as resolved until the approved change has actually been applied and the conflict markers are gone.

If the user approves a resolution, apply only that resolution, verify the specific conflict is gone, and present the next conflict's analysis. If the user says to skip, leave that conflict untouched and present the next conflict. If there are no unresolved conflicts, report that fact without making changes.

When all conflicts have been processed, provide a final summary with:

- A list of every fixed conflict, including its file and a brief description of the applied resolution.
- A list of every skipped conflict, including its file and a brief description of why it was skipped.

$ARGUMENTS
