Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id B5BD96E63E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 10:45:04 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id w7so5578515qcr.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=eqn+A6oX9o+dNAxvvOM5/Bq83Y9CHrYm+J9RJ7VAwCw=;
	b=TqDQEbc2dixWi15p9w6J7WTbCVvH51rzqTsebN9K4zyPW5duYtvsXq5c1Hma4Vu0xL
	i/ExDylmV7/9ABqCAJPdsCTO7I2g2H4BhD/rozHoJS9k6nGdnttrHRFiBpnwvHgWCZ7T
	kGkivsKWz4DCETyjWl4eTI6o5UomH0FOmmD4FJHrGRiD7Og4TzE6l1BXW0lFHuRTsSNe
	vBvxmOhj/xS21a+h1WCs+DJyapgOqYHYsO/yfZEdCNN2uaDs6065lQduA/Qo1txfVJzp
	2t+aZTEndRVwrViTE084vsw2ugQrFAJtBk4EWVfIeAgCFZvvmjacvLC0AdIz8jsDadLV
	3Mrg==
X-Received: by 10.224.61.7 with SMTP id r7mr36059748qah.9.1414752304541; Fri,
	31 Oct 2014 03:45:04 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Fri, 31 Oct 2014 03:44:24 -0700 (PDT)
In-Reply-To: <54525C63.4070309@linaro.org>
References: <CANyK_8cFPyXs2R5+x3AiMNnPW4Q6hWnNdsjTHrf50M4F6VGJQQ@mail.gmail.com>
	<54525C63.4070309@linaro.org>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 31 Oct 2014 10:44:24 +0000
X-Google-Sender-Auth: FQA3DNZo83Eynv93gCvTdjo3iBA
Message-ID: <CANyK_8dxGiwRJ_o-g-QCYS2XBrZDV0jHbZ+gO=6n5pBs_4Q7xA@mail.gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg Status Update
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
X-List-Received-Date: Fri, 31 Oct 2014 10:45:04 -0000
Content-Type: text/plain; charset=UTF-8

On 30 October 2014 15:42, Trevor Woerner <trevor.woerner@linaro.org> wrote:
> Hi Paul,
>
> I too wanted to express my thanks to you for this work!
>
> On 10/28/14 19:33, Paul Barker wrote:
>> This would be a great time for someone to step up and
>> help move things forward to v0.4.0 and beyond.
>
> Is there a roadmap for opkg somewhere?

There isn't currently a roadmap. I'm currently just trying to get
v0.3.0 out the door as it's dragged on a lot longer than I'd planned.
I'm probably going to aim for shorter, smaller development cycles
after this release.

Once v0.3.0 is released I'll be updating the opkg issue tracker
(https://code.google.com/p/opkg/issues) to include planned bugfixes
and enhancements for the v0.4.0 and v0.5.0 releases. If you've got any
feature requests for the next release cycle or two, please add them to
the issue tracker.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

