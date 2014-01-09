Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id A74EB6A463
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 15:38:23 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id x13so3590719ief.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 07:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=SrZCudYZDm5usEHR/QqghAzRyiPk2IIwCr7eu11xMy4=;
	b=Z59xE5DH6e1wMyyuR0KNgIbJnAJd6/2lkDMEyUZDa+h2SW+kJ2mSmMDr/cdW+ObZ+e
	BTCN4HLS7nIH3Tys/+d46Ld2l+pOrpr7CqqQQ4uUhX4weQpYzoSxBNay00N6kOd/Z+JL
	69aBgoTuFdeKef04fIADTQf8HsjAkN4j9hhI5kGgHZ34ziAHCz2/NDIJ+DyMhzAo/nZO
	EE+PTBuQTyfxCvRVrG/Q7IH7mdw0MAir0Yv5AxddYLxwQG15UV9rDgXCJ7xO77332C7E
	qel3gX3R5uP83ztN/HKkElkFi0b617KOXpatzQyVMJXp1JnOjAtFGwdCA6G0v79I+5/9
	egSA==
X-Gm-Message-State: ALoCoQmCvrTTRKWhRQJjXU3+UjQ8E96D//ZR3ToArJiX4fg/2zzjIKHM3SOfmdbcLQV3V4B8PfIA
X-Received: by 10.42.61.4 with SMTP id s4mr2935927ich.58.1389281904623;
	Thu, 09 Jan 2014 07:38:24 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id ft2sm8281304igb.5.2014.01.09.07.38.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 Jan 2014 07:38:23 -0800 (PST)
Message-ID: <52CEC26E.1080603@linaro.org>
Date: Thu, 09 Jan 2014 10:38:22 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <52CDDD3E.7040508@linaro.org>	<52CE8075.8040700@communistcode.co.uk>	<52CEBB27.10709@linaro.org>
	<CAP9ODKpxHnLq1PLJJp2LsGt4WGD9Q159Jo_nQnNNaLy1gzDXSw@mail.gmail.com>
In-Reply-To: <CAP9ODKpxHnLq1PLJJp2LsGt4WGD9Q159Jo_nQnNNaLy1gzDXSw@mail.gmail.com>
Subject: Re: bug scrub - RFC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jan 2014 15:38:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


On 01/09/14 10:34, Otavio Salvador wrote:
>
> On Thu, Jan 9, 2014 at 1:07 PM, Trevor Woerner
> <trevor.woerner@linaro.org <mailto:trevor.woerner@linaro.org>> wrote:
>
>     On 01/09/14 05:56, Jack Mitchell wrote:
>     > On 08/01/14 23:20, Trevor Woerner wrote:
>     >> questions:
>     >> 1) Currently it has been suggested this should be a 2-day
>     event, should
>     >> these two days be during the week or over a weekend? In either
>     case,
>     >> which 2 days?
>     >>
>     > If it's two days long then why don't you do the best of both
>     worlds and
>     > have a Friday/Saturday or Sunday/Monday combination?
>
>     I was thinking of doing it either fully during the week, or fully on a
>     weekend since my feeling is that most people either work with OE/Yocto
>     during the weekdays or on the weekend. There's nothing to say we
>     couldn't run this "bug scrub" during the week, then run a second "bug
>     scrub" 2 months from now on a weekend (or visa versa).
>
>
> Maybe mix it, Friday, Saturday, Sunday, Monday.
>
> So we give in a single 'event' opportunity to both.
>

Okay, I can agree to that.

How about targeting next weekend (Jan 17-18 2014). Would that be too soon?

