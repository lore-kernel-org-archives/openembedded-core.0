Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id AB65F60030
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 12:15:17 +0000 (UTC)
Received: by mail-yk0-f181.google.com with SMTP id 142so5720765ykq.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 04:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=l1Mq/xiHdr7MQTt8poPUh6mp1gR/RIhorZLnrEIwUKk=;
	b=A78Tadydy9Fq8wjB7xCQQO6nXh8Z6s1RdpJq9Bpuf7Evvz6eQxifWGZlmPrr8hmRif
	GqBpl2xpabxGdB6ZEl88T2ow3Zh/Q4wQd8ib1F+clMxSjQiDAkve+LBoS3D/pROB7+w1
	0G1OrHfsXEMuMwNABhdlNGVjMu6V2ED+Pvf/W9gw/uFpiFnoGgeAZb8vSEVuBxU9hhXI
	az6qUHRhiLOHOTXpoLnP+XUjVSP5OSVlaT14VooeoZXNgcKYQ5kgcCc4aJz1CJPaX/jI
	oCTDuLBOzMnSfkVvsKAyNRzdsSDyX7OUC5/1J8REd7EsBW6qb4FRMgmQyL7Xhh4QSPbl
	vtCA==
MIME-Version: 1.0
X-Received: by 10.170.47.210 with SMTP id 201mr75488379ykp.30.1417522518121;
	Tue, 02 Dec 2014 04:15:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Tue, 2 Dec 2014 04:15:18 -0800 (PST)
In-Reply-To: <BY2PR03MB441E1542D0395E6BAFE4571847A0@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1416806658-15685-1-git-send-email-B40290@freescale.com>
	<BY2PR03MB441E1542D0395E6BAFE4571847A0@BY2PR03MB441.namprd03.prod.outlook.com>
Date: Tue, 2 Dec 2014 10:15:18 -0200
X-Google-Sender-Auth: H0SoOc__FroFzeQlTK1y_Q1huyI
Message-ID: <CAP9ODKrnw8sQY_OD47CQHjj2SbWw8isz_s2===TxaCfhFizgEg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "B40290@freescale.com" <B40290@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] uboot-config.bbclass: Allow multiple U-Boot config for machine
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
X-List-Received-Date: Tue, 02 Dec 2014 12:15:19 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 2, 2014 at 1:50 AM, B40290@freescale.com
<B40290@freescale.com> wrote:
> Ping.

I was traveling and couldn't test it. I will test it and comment asap.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

