# Exam03: 複数の非同期処理を並列に連結した処理

## Goal

複数の非同期処理の連携操作を理解する（並列）

## 概要

1. `exec` を実行
2. `asyncMethod(index: 1)`、`asyncMethod(index: 2)`、`asyncMethod(index: 3)` が開始される
3. 全ての `asyncMethod` が終了したら完了通知を発行
4. `exec` 内で上記の完了通知を受信
5. **async (insex: duration:)...** 文字列表示

２〜４、６〜８が非同期処理となる。