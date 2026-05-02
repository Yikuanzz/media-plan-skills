# regional-auto-launch 持久化与反压缩硬闸改造

## 用户诉求（脱敏）

用户要求 regional-auto-launch 输出必须落盘，并禁止章节压缩/缩略，最终 `proposal.md` 必须由分章节文件机械拼装。

## 主要改动

- 新增 `shared/persistence-rules.md`，定义目录、slug、触发表、失败处理、装订顺序、linkage 检查。
- 升级所有 phase 合同，落盘 `00`-`09` 章节文件。
- proposal 改为仅在 Review Pass 通过后写 `proposal.md`，失败进入 loop。
- 新增 Standard 6（C1-C7）反压缩硬闸与阈值常量。

## 关键影响文件

- `skills/regional-auto-launch-plan/SKILL.md`
- `skills/regional-auto-launch-plan/phases/*.md`
- `skills/regional-auto-launch-plan/shared/quality-self-check.md`
- `skills/regional-auto-launch-plan/shared/persistence-rules.md`
