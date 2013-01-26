Received: from mail-la0-f51.google.com ([209.85.215.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TyuKK-0005mo-Ns
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 02:13:00 +0100
Received: by mail-la0-f51.google.com with SMTP id fo13so170298lab.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 16:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=HyOdaz9cZREdY0Ft9ilTQ55Qymst8CqRpYss5srt+Bs=;
	b=m/m/a7cTFPRNaQ5yx5LgajbLIIJun1Gx1urt/j3QtLcu9aQGAS8N4YVpzszI/y8PCi
	D47xBfmi+tkqtnlQ6RF6uechnR7iQoopfbEI3MZOLPTfZYS//bmi9lJC72SRKnMa9zf5
	kq3nMj1bdI83vDCinwDqcFhWsS2krgiMZK4v16VaKp0S0ycCs3nUFUeDgaPmq8/IJDWR
	n/+hedy910QS4e81yJ2rtwPb/ASVrgQxUVgsAJlAT7admmsskKT7mWvw7xX6xCm6sFSv
	uhNg8GCqSYfp5ctJ7G1uMNtyCRjQkq//IjK1zNKhXT+A8/o/0XRxdJT+orzaa9aA1g+m
	08RA==
X-Received: by 10.152.45.140 with SMTP id n12mr6774747lam.36.1359161845566;
	Fri, 25 Jan 2013 16:57:25 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Fri, 25 Jan 2013 16:57:05 -0800 (PST)
In-Reply-To: <1359161744-4193-1-git-send-email-kergoth@gmail.com>
References: <1359161744-4193-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Fri, 25 Jan 2013 17:57:05 -0700
X-Google-Sender-Auth: UT9W_JDTON_HJlZYflS90yo9IQM
Message-ID: <CABcZANnHeQ9eWZf2LPh0=UCt0=WLPOEyTk+eKNGWfa=kiCB+Vw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] tinfoil: support other fds, enable color support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Jan 2013 01:13:00 -0000
Content-Type: multipart/alternative; boundary=bcaec5524516ff4ebb04d4268666

--bcaec5524516ff4ebb04d4268666
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 25, 2013 at 5:55 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Rather than only handling sys.stdout, also support any arbitrary file
> object,
> and enable color for the formatter if that file is a tty.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Erm, ignore this, wrong list. I fail at navigating my shell history today,
apparently

--bcaec5524516ff4ebb04d4268666
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Jan 25, 2013 at 5:55 PM, Christopher Larson <span dir="ltr">&lt;<a href="mailto:kergoth@gmail.com" target="_blank">kergoth@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":1e9">From: Christopher Larson &lt;<a href="mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>


<br>
Rather than only handling sys.stdout, also support any arbitrary file object,<br>
and enable color for the formatter if that file is a tty.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href="mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br>Erm, ignore this, wrong list. I fail at navigating my shell history today, apparently</div>

</div>

--bcaec5524516ff4ebb04d4268666--
