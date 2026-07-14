增长团队将在 2026 年 6 月 24 日上线 FlowForge Sprint 的 Launch-Week 协作试用，需要制作一张用于 LinkedIn sponsored single image 的横版产品发布图。

closed-env，禁止使用 web。请只使用 task.md 和 env/ 中的文件。

以 2026 年 6 月 23 日 17:00 UTC 为创意冻结时间。请按以下顺序解析最终交付要求：

1. 从 Campaign_Operations.xlsx 中依次解析冻结前最终有效的 Placement Profile、Base Copy、Campaign Layout 和 Launch Message Package。
2. 在得到最终 Launch Message Package 后，再从 Launch_Activation_Register.xlsx 中筛选唯一有效的 Activation Package。Activation Package 必须与已选 message_id、campaign、profile、market、placement 和 language 全部一致；冻结前最后状态必须为 Active；上线日必须处于有效窗口内。
3. Activation Package 的优先级高于 Launch Message Package：它会覆盖受众、优惠、发布时间、proof chip、CTA、落地路径和限定语，并新增一条 evidence line。基础文案中的产品名、标题和支持句仍然保留。
4. 根据 Activation Package 引用的 cohort_id、offer_id、schedule_id、proof_id、destination_id 和 qualifier_id，从对应 catalog 中读取最终消费者文案，并核对 catalog 状态、市场、语言和有效期。
5. 根据 Activation Package 引用的 experiment_id，从 Experiment Assignments 中取得最终 asset bundle 和 board content；实验分配必须与同一 campaign、profile、market 和 placement 匹配，并在上线日有效。
6. 根据 Asset Bundles 与 Board Content 取得 Logo、Hero、背景、proof chip 及最终看板内容。随后联合 Creative_Asset_Register.xlsx 的 Asset Index、Approval History、Usage Matrix、Rights Register 和 Version Control，逐项确认素材在冻结前及上线日均有效。
7. 不得根据文件名、ID 顺序、行号、文件顺序、外观相似或单独一条 Approved/Active 记录猜测答案。

最终画面必须使用 1200 × 627 画布，完整呈现最终产品名、标题、支持句、Activation 受众、优惠、evidence line、发布时间、proof chip、CTA、落地路径和限定语。Hero 必须使用最终 Launch-Week board 内容；单独的 FlowForge 横版签名必须出现在产品看板之外。

最终只交付一张完整 PNG。画面中不得出现 activation ID、experiment ID、bundle ID、asset ID、profile ID、审批状态、版本标签、工作表字段名、筛选过程、来源说明或其他内部生产信息。
