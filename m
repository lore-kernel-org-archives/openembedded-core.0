Return-Path: <rudolf.streif@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id B9D4C60762;
	Mon, 11 Apr 2016 22:35:22 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id zm5so365744pac.0;
	Mon, 11 Apr 2016 15:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qcJZANuJPrfzQdQyFbumbR758JT7vQplsSIWeaVdkX4=;
	b=XzNfGlqqpLM3RLx37rmcQXxawZPwzv55W/2qbyTjXKe253e5KYidY/QPLsacieNvFV
	LTxQhU4ZG+4Q9HeHkrcDofZdnWZnM4oqlmSncn5/1IRJmwDRPdZctNO9JI3jyFaEeYyP
	Z0iY2qysUT98a5njHt+JLKCdu2zgX3zvwd/VM/167/j78i6CZrWIJdjFIUO80V3mQlE1
	lzZjFOhf0iLGx3TxTfBK1QuAI67KDk2BYhYY7gfrmVl3l0DHdfcmnknBawmRXV3VUt2p
	sF2iFIPk+ci1m6GcOp89y8XBWXyaofFV86TspPgTrV+2F3d0ajMsY5fmFQuEmT0J0ZA6
	yZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qcJZANuJPrfzQdQyFbumbR758JT7vQplsSIWeaVdkX4=;
	b=DI1uE2FYvFPjrPST84ubmTwzo8vBkVXhOQbOXjJnY1eiU/Qx+7o+8xYM0cQ9xEmXXW
	+1sm7xICp0F5TfqIQ4secfvsz97qINBy4XsbuRnAYrqcVyovuR/IBVRPjJpbwt8ADFAp
	Rm8CwFYwQuGGGaidV5dD1tHuPj86PPXgaeIXOqBgmKy5svpQbxlP6A7uqJJR+2t2tKgW
	9StySI/eWQNbu0CvMG9Q6dG557ZfAhndortvrWfVaqTuAVcPpN+USpwk/usHcxqFWpCk
	hVuyDZyZJSN1ZcKiA8u9fbNITMVDubdidp9lHPEqqP5mHFNlXprBprrF+ELmvJ0M3YRf
	v3TQ==
X-Gm-Message-State: AD7BkJLJ16cUEO21bstDs1jkpTbp6yCW4ltw00WL7RliRTrhV6dmI0ERV03LV2YoziISng==
X-Received: by 10.66.162.39 with SMTP id xx7mr35823858pab.97.1460414122992;
	Mon, 11 Apr 2016 15:35:22 -0700 (PDT)
Received: from rjs-zotac.streifs.net (ip68-7-48-20.sd.sd.cox.net. [68.7.48.20])
	by smtp.gmail.com with ESMTPSA id h5sm38542987pat.0.2016.04.11.15.35.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Apr 2016 15:35:22 -0700 (PDT)
From: Rudolf J Streif <rudolf.streif@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Apr 2016 15:35:21 -0700
Message-ID: <2408177.Nm4BLto1dd@rjs-zotac.streifs.net>
User-Agent: KMail/4.14.10 (Linux/4.4.6-201.fc22.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <56F30D13.6030909@balister.org>
References: <56DEF97F.9070306@balister.org> <1458767514382.89578@seescan.com>
	<56F30D13.6030909@balister.org>
MIME-Version: 1.0
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>
Subject: Re: [oe] [yocto] OEDAM, April 8 in San Diego after ELC
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
X-List-Received-Date: Mon, 11 Apr 2016 22:35:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello Everyone:

If you attended OEDAM last Friday in San Diego, I very much hope that you enjoyed being here.

The Catamaran Hotel, where we held the meeting, would very much appreciate your feedback:

www.catamaranresort.com/trip

I hope you all had a safe trip back home,
Rudi



