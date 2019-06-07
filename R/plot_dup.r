plot.log.axis=function(at)
{
    for (i in 1:length(at))
        mtext(text=bquote(paste('10'^.(at[i]))), side=2, at=at[i], las=2, line=1)
}

plot.dup.f=function(ifn, odir)
{
    df = read.delim(ifn)
    multi = 1:max(df$multi)
    ix = match(multi, df$multi)
    count = ifelse(!is.na(ix), df$count[ix], 0)
    l.count = log10(count+1)

    ######################################################
    # multiplicity table
    ######################################################

    system(paste("mkdir -p", odir))
    ofn = paste(odir, "/multiplicity.pdf", sep="")
    cat(sprintf("generating figure: %s\n", ofn))
    pdf(ofn, height=5, width=6)
    par(mai=c(1, 1, 0.5, 0.5))
    plot.new()
    plot.window(xlim=c(1, max(multi)), ylim=c(0, max(l.count)))
    grid()
    axis(1)

    # log ticks
    axis(2, labels=F)
    at = axTicks(2)
    plot.log.axis(at)

    box()
    title(xlab="molecule multiplicity", ylab="# reads")
    points(multi, l.count, pch=19, col="darkblue")
    dev.off()

    ######################################################
    # cumulative sum
    ######################################################

    fraction = 100 * cumsum(count) / sum(count)
    ofn = paste(odir, "/cummulative_percent.pdf", sep="")
    cat(sprintf("generating figure: %s\n", ofn))
    pdf(ofn, height=5, width=6)
    par(mai=c(1, 1, 0.5, 0.5))
    plot.new()
    plot.window(xlim=c(1, max(multi)), ylim=c(0, 100))
    grid()
    axis(1)
    axis(2, las=2)
    box()
    title(xlab="molecule multiplicity", ylab="% reads")
    points(multi, fraction, pch=19, col="darkblue")
    dev.off()
}

