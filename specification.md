# Спецификация приложения для Яндекс.Директ API

## 1. Архитектура приложения
Docker stack: PostgreSQL, Vault, ZooKeeper, Kafka, Bitrix, NocoDB, n8n.

## 2. Примеры REST-запросов

### GET Campaigns
```http
GET https://api.direct.yandex.com/json/v5/campaigns
Authorization: Bearer <token>
Content-Type: application/json
```

### POST Ad
```http
POST https://api.direct.yandex.com/json/v5/ads
Authorization: Bearer <token>
Content-Type: application/json

{
  "method": "add",
  "params": { ... }
}
```

## 3. БД ER-схема
```
leads (UUID) ← campaigns (serial) ← content_items (UUID)
```

*…другие разделы…*
