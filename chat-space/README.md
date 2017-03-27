# README

## データベース設計

### usersテーブル（deviseで実装）

| *カラム* | *データ型* | *NOT NULL制約* | *一意性制約* | *外部キー制約* | *INDEX* |
|:-----------|------------:|:------------:|:-----------|------------:|:------------:|
| name | string | ○ | ○ | - | ○ |
| email | string | ○ | ○ | - | ○ |
| password | string | ○ | × | - | ○ |

```
has_many :messages
has_many :groups, through: :group_users
```

### groupsテーブル

| *カラム* | *データ型* | *NOT NULL制約* | *一意性制約* | *外部キー制約* | *INDEX* |
|:-----------|------------:|:------------:|:-----------|------------:|:------------:|
| name | string | ○ | ○ | - | ○ |

```
  has_many :messages
  has_many :users, through: :group_users
```

### group_usersテーブル

| *カラム* | *データ型* | *NOT NULL制約* | *一意性制約* | *外部キー制約* | *INDEX* |
|:-----------|------------:|:------------:|:-----------|------------:|:------------:|
| group_id | references | ○ | × | ○ | ○ |
| user_id | references | ○ | × | ○ | ○ |

```
  belongs_to :group
  belongs_to :user
```

### messagesテーブル

| *カラム* | *データ型* | *NOT NULL制約* | *一意性制約* | *外部キー制約* | *INDEX* |
|:-----------|------------:|:------------:|:-----------|------------:|:------------:|
| body | text | × | × | - | ○ |
| image | string | ○ | × | - | × |
| group_id | references | ○ | × | ○ | ○ |
| user_id | references | ○ | × | ○ | ○ |


```
  belongs_to :user
  belongs_to :group
```
