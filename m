Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id E1ECA62252
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 10:34:54 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id a41so9198506yho.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 02:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=NXRlifHb5vWzRO98gRKUptVm+Cu+loG++mKunvYDhCI=;
	b=fMNK6IiWnCA2hE1U9igo4dUhB+UEGd2THU6BQpkxIxJlqcx7KzEUuxhW08dZ1jgM0q
	i30x3QjIEfYpRoqIKq8FsPfGvhtB2PdLpA4ZIIUnilESEi2CH040bwW6juHGq7kIY/iF
	8YAmT8OZQFkXBGG0m/9Tj/hxisnsXqivzZ9iqZ8mThisMC5kLsQBu43YyLZR42hP9kye
	M2mkFRjDa8W4WjJgJI9FRy3hql0/mBq3pmGCJFljaYAgNnGERAeKnM3EsYLBt3p4FdPg
	n20U91QoCSAVwO8vOmaLgc1CQUg0THs615gidrLCSzOqsejK4CFqXj4qRdb3O2JEUhYm
	fcBA==
MIME-Version: 1.0
X-Received: by 10.236.30.98 with SMTP id j62mr21814763yha.105.1421058895166;
	Mon, 12 Jan 2015 02:34:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Mon, 12 Jan 2015 02:34:55 -0800 (PST)
In-Reply-To: <BY2PR03MB441F9A06C9DA2EA7ACA524C84430@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1418268775-20010-1-git-send-email-B40290@freescale.com>
	<BY2PR03MB441F9A06C9DA2EA7ACA524C84430@BY2PR03MB441.namprd03.prod.outlook.com>
Date: Mon, 12 Jan 2015 08:34:55 -0200
X-Google-Sender-Auth: AUooGEtFtP_URx8ZtNhVp1pILYA
Message-ID: <CAP9ODKqUz=R8KMVk=WoMcbnnEMPQpNtSC=0S4nG7u2o=hZSvjQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "B40290@freescale.com" <B40290@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Mon, 12 Jan 2015 10:35:04 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 12, 2015 at 6:20 AM, B40290@freescale.com
<B40290@freescale.com> wrote:
>
> Ping.

Sorry; I will review it today.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

