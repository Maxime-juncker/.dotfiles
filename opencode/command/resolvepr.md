---
description: Resolve unresolved review comments on a Gitea pull request interactively, committing and annotating each fix.
agent: build
---

Resolve the Gitea pull request identified by `$ARGUMENTS`.

## Identify the PR

1. Treat `$ARGUMENTS` as a PR number, PR URL, branch name, or distinctive PR title. If it is empty or ambiguous, ask the user for the exact PR number before changing anything.
2. Determine the repository owner and name from the current Git remote. Prefer the Gitea remote matching the configured Gitea host. If the remote or repository cannot be determined, ask the user rather than guessing.
3. Use the Gitea MCP tools for all PR, review, comment, and resolution operations. Fetch the PR details, changed files, reviews, and review comments before taking action.
4. Confirm the working tree and current branch state. Never discard existing user changes. If the worktree has unrelated uncommitted changes that could be affected by a proposed fix, stop and ask how to proceed.

## Review the comment queue

1. Build a queue containing every currently unresolved inline review comment and unresolved review thread. Preserve each comment's author, file, line, body, thread context, and API identifiers. Treat a comment as unresolved only when the Gitea response explicitly says it is unresolved or its thread is not resolved; do not infer resolution from the text.
2. Present the complete queue in a compact numbered list, including enough context for the user to distinguish comments. Explain that the user may ask to skip/remove an item from this working queue, ask for clarification, or add/specify a task to apply to the queue or a selected comment. Do not delete comments or resolve anything at this stage. If Gitea cannot delete a comment, say so plainly and offer to skip it instead.
3. Wait for the user's response. Apply requests to skip an item, explain an item, or add/specify a task, then show the resulting queue and ask for confirmation. Accept short affirmative responses such as `y`, `yes`, `good`, `ok`, `okay`, `approved`, or an equivalent clear approval. Never interpret an ambiguous response as approval.
4. If there are no unresolved comments, report that state and stop without making a commit.

## Resolve one comment at a time

For the first remaining comment, repeat this loop exactly:

1. Explain the issue, relevant code, likely root cause, and a concrete proposed change. Include the intended tests or verification. Ask the user to approve the proposal or provide changes. Do not edit files yet.
2. Incorporate the user's requested changes into the proposal and ask again when the request changes scope or intent. Continue until the user clearly approves the exact proposal.
3. Implement only the approved change. Keep the diff focused on this comment. Run the most relevant existing tests, type checks, linters, or targeted verification. If verification fails, report the failure and fix it before asking for final approval; do not hide or waive failures.
4. Show the resulting diff and verification results. Ask whether the user approves committing it. A short affirmative response is approval; otherwise apply requested changes, re-verify, and ask again.
5. Once approved, create a focused Git commit. Use a concise repository-style message that describes the fix. Verify the commit succeeded and record its short hash. Never amend an existing commit and never commit unrelated user changes.
6. After the commit succeeds, use the Gitea MCP to resolve this exact review thread/comment and add a short reply in this form: `Fixed in [<short-hash>](<commit-url>), <very small description>`. Link the actual commit name/hash to its Gitea commit URL, using the repository's host, owner, name, and commit hash. Keep the description factual. If the API cannot resolve the thread or post the reply, report the exact operation that failed and leave the code commit intact; do not claim it was resolved.
7. Refresh the PR's review comments from Gitea, remove the completed item from the local queue, and show the remaining unresolved queue. Then ask whether to continue. Do not start the next item until the user clearly approves continuing.

## Completion

Continue the one-comment loop until the refreshed Gitea response contains no unresolved comments that the user approved for handling. At the end, report every handled comment with its commit hash and reply status, plus any skipped comments, unresolved API operations, failed checks, or follow-up work. Before declaring success, re-fetch the PR comments and verify that every handled thread is resolved and has the commit-reference reply.

## Safety rules

- The user controls every transition from review to proposal, proposal to implementation, and implementation to commit.
- Use the repository's existing conventions and tests; inspect them before choosing commands.
- Keep commits atomic and limited to the approved review comment.
- Do not force-push, merge the PR, close the PR, rewrite history, or alter unrelated files.
- Do not resolve a comment merely because code was changed. Resolution and the commit-reference reply happen only after the commit succeeds and only for the exact handled thread.
