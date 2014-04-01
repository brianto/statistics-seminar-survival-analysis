ws <- read.csv('worksheet.csv', header = TRUE)
ws$id <- sprintf('%02d', 1:nrow(ws))

ws.rawdisp <- ggplot(ws, aes(y = id, yend = id, colour = event)) +
  ggtitle('Event Timeline') +
  xlab('time') +
  ylab('observation') +
  geom_segment(aes(
    x = start,
    xend = end,
    order = id)) +
  geom_vline(aes(
    xintercept = max(end)), colour = 'red', linetype = 'longdash') +
  geom_point(aes(
    x = end), size = 4)

ws.durationdisp <- ggplot(ws, aes(y = id, yend = id, colour = event)) +
  ggtitle('Event Duration') +
  xlab('duration') +
  ylab('observation') +
  geom_segment(aes(
    x = 0,
    xend = duration,
    order = id)) +
  geom_point(aes(
    x = duration), size = 4)

ggblank <- ggplot(data.frame()) + geom_point()

ans.failure <- ggblank +
  xlim(0, max(ws$duration)) +
  ylim(0, 1) +
  scale_y_continuous(
    breaks = 0:9 / 9,
    minor_breaks = 0:18 / 18)