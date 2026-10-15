# FR 2: Status Lifecycles for Entities

## Scope
Each entity level has an appropriate status enum reflecting its role in the model.

## Statuses

### IssueStatus
`TODO → DOING → INACTIVE → DONE`
- Simple linear progression. Issues represent concerns; they're either pending, active, parked, or resolved.
- `INACTIVE` — parked. The issue is not being worked on and is not finished. It demands no attention (it never bubbles a priority) and it does not count as finished work (a project with parked issues is not `DONE`).
- Status ordering (sorting, filtering, analysis columns) is `TODO, DOING, INACTIVE, DONE` — active work first, parked next, finished last.

### TasklistStatus
`TODO → DOING → DONE, CANCELED`
- Adds `CANCELED` — tasklists represent workstreams that can become irrelevant without the issue being done.

### TaskStatus
`TODO → DOING → DONE, FAILED, CANCELED`
- Adds `FAILED` — tasks are atomic operations that can fail independently. A failed task doesn't cancel the tasklist; it signals a blocker.

## Details
- All entities start in `TODO` on creation
- Status transitions are unrestricted (no state machine enforcement)
- Status is mutable via dedicated endpoints (`PATCH /{entity}/{id}/status`)
