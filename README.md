# unbound
- https://hub.docker.com/r/widecamp1903/kea-dhcp
- M-Rootだけに問い合わせるようにしたかったけどUnboundが何故かroot.hintsを読み込んでくれないのであきらめた
- *.noc.wide.campのローカルゾーンを解決
- mgmtとinternal-serverの両方に足を出す

## ESXi側
- `/etc/netplan/50-cloud-init.yaml` を編集してアドレスを固定
- internal-serverのメトリックを一番小さくすること（デフォルトルート）
  - 本番中はmgmtは閉じる予定？

## デプロイ
- まずは`docker-compose.yml`の待受アドレスを環境に合わせて修正
```
% make init
% make run
```
