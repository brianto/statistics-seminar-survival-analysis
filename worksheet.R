timeline <- read.csv('example-timeline.csv', header=TRUE, row.names=1)

# Study ends at t = 7
survival <- survfit(Surv(start, end, event) ~ 1, data = timeline)

timeline.plot <- ggplot(timeline) +
  xlab('time') +
  ylab('observation') +
  labs(
    colour = "Observation",
    shape = "Event Occured?")+
  geom_segment(aes(
    colour = rownames(timeline),
    x = start,
    xend = end,
    y = rownames(timeline),
    yend = rownames(timeline))) +
  geom_point(aes(
    colour = rownames(timeline),
    x = start,
    y = rownames(timeline)), size = 4, title="asdf") +
  geom_point(aes(
    colour = rownames(timeline),
    shape = event,
    x = end,
    y = rownames(timeline)), size = 4) +
  geom_vline(
    xintercept = 6,
    colour = 'red',
    linetype = 'longdash')

timeline.plot