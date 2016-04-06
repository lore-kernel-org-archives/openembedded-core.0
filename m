Return-Path: <jefro.net@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3114575C60;
	Wed,  6 Apr 2016 03:39:26 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id vo2so21633025lbb.1;
	Tue, 05 Apr 2016 20:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=hRdqGXURQDRjbixjtEa0gmBj955m7k+OzWisHdZ0v+w=;
	b=CTWggMDS3h72esVSVyOIkGuODQMqUXSAHeseU6Nbtwjw13+vXBTXov4DKmZxvbGHjr
	xDocUAn7wu6QciBjt9staReOwIAgvjlT4r3gXFXA7EltxQsGwQipYoH0POda92fkINL/
	OqKuq6lk53noT+wej0iXECeJcJ3QuULqiuVbQXMGG+V2UUCRZkC3gdaBAq7RupjlisnD
	cpH8IEIiaWlZ/Aerp0xR6lPXizWTqjvhDFlcZR0VmWY4LMlDDtdFj5jv/NRJG0t0rdim
	YPv3HupIvvECoeljoPb/h1g/QXrvf3WgnNZZzP2kxbg5fzI9trqpdBw4U3+secoZUYaA
	HT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=hRdqGXURQDRjbixjtEa0gmBj955m7k+OzWisHdZ0v+w=;
	b=IPAJyCg5PkNCeuO1MD4zq+AOD+DIySADJQPnBiF86+CIvRcnsItSwUCcwDFLMx2dSl
	bfkaMVrAC/z6pQr56UpyosgdZdDThKsmKrCrR8kDvD8M36t0XW2eoLRq4uRHhLva/7C9
	JvnkzP7bW75rqlyz6aXzA/+8pCdHg11iVv/+AFT1I2FlJ4kleYSEYbQRkqlQWCJ18tJD
	9tCF65LA0b0+qpI4QRxHbXVhn+1IxRKKAfXvLiJ0x0DC5QiEoY0ighQMA+uXlRSJxr07
	mq6rForCdrRMmqN2scZp+UrfiQN3aV5fmcWqoz0llH8+DkGFGi9Bxb0oJjYLBneRcuat
	Riig==
X-Gm-Message-State: AD7BkJLsBSyKjfHgdzZKvmVszN3bjUC5rEKz2tCeBoqyxNkYHQGp6p2nOtsBs+NA2LN/Hu9+zqBcV1NlkfQJJw==
X-Received: by 10.112.168.194 with SMTP id zy2mr971674lbb.102.1459913966035;
	Tue, 05 Apr 2016 20:39:26 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.112.55.101 with HTTP; Tue, 5 Apr 2016 20:39:06 -0700 (PDT)
In-Reply-To: <1604312.a7pP1GrPCb@rjs-zotac.streifs.net>
References: <56DEF97F.9070306@balister.org> <1458767514382.89578@seescan.com>
	<56F42DA1.4090902@balister.org>
	<1604312.a7pP1GrPCb@rjs-zotac.streifs.net>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Tue, 5 Apr 2016 20:39:06 -0700
X-Google-Sender-Auth: Mk0JilE2j0LKoSt9vWVXcML-Sg0
Message-ID: <CA+YB3ra_JQ5tqYgzD9BWBwNi4V+Y1sQYPNNpyPS9a+Q8h27NqQ@mail.gmail.com>
To: Rudolf J Streif <rudolf.streif@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [oe] OEDAM, April 8 in San Diego after ELC
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
X-List-Received-Date: Wed, 06 Apr 2016 03:39:27 -0000
Content-Type: text/plain; charset=UTF-8

Just a final transportation update for those attending OEDAM.

Transportation will be via carpool. Tom, Rudi, Armin, and myself have
volunteered to drive. Together we have room for 19 out of the 20
signed up. Let's plan to meet in front of the Hyatt at 8:30am on
Friday. If you are late or otherwise unable to be there at that time,
let me know and we'll arrange alternate transportation. If you are
planning to drive yourself, please let me know so we don't wait for
you.

Armin will be driving north after the meeting, so if you ride up there
with him I will either make two trips back or arrange for a cab.

