# Exam01: 複数の非同期処理を直列に連結した処理

## Goal

複数の非同期処理の連携操作を理解する（直列）

## 概要

1. `exec` を実行
2. `asyncMethod(index: 1)` が開始される
3. 一定秒数後に `asyncMethod(index: 1)` から完了通知を発行
4. `exec` 内で `asyncMethod(index: 1)` 完了通知を受信
5. **async 1** 文字列表示
6. `asyncMethod(index: 2)` が開始される
7. 一定秒数後に `asyncMethod(index: ２)` から完了通知を発行
8. `exec` 内で `asyncMethod(index: 2)` 完了通知を受信
9. **async 2** 文字列表示

２〜４、６〜８が非同期処理となる。