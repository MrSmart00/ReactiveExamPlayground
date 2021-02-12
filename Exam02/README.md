# Exam02: 複数の非同期処理の結果を一つのハンドラにまとめる処理

## Goal

複数の非同期処理の連携操作を理解する（結合）

## 概要

1. `exec` を実行
2. `asyncMethod(index: 1)`、`asyncMethod(index: 2)`、`asyncMethod(index: 3)` が開始される
3. 順不同に `asyncMethod(index: 1)`、`asyncMethod(index: 2)`、`asyncMethod(index: 3)` それぞれから完了通知を発行
4. `exec` 内で `asyncMethod(index: 1)`、`asyncMethod(index: 2)`、`asyncMethod(index: 3)` それぞれの完了通知を受信
5. **async 1** or **async 2** or **async 3** 文字列を順不同で表示

２〜４が非同期処理となる。