durations <- 1 + rpois(n = 10, lambda = 3)
offsets <- sample(0:5, size = 10, replace = TRUE)
ends <- offsets + durations
event <- sapply(ends, function(end) { return(end < 8) })
timeline <- data.frame(start = offsets, end = ends, event = event)

# Study ends at t = 7
survival <- survfit(Surv(start, end, event) ~ 1, data = timeline)

timeline.disp <- with(timeline, )