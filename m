Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC126F242
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 19:40:29 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id im17so8627666vcb.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=XskUMm7r9bhuzXhLxOFqHd7okZcxVqLzFgG2Q4YMiYM=;
	b=RLGmef4Ln47xInENFlm6UMEE+AxrLLFAH+9ytoI84YH6DNjBpRr7AM6G8NgO3MY1zH
	yML78zcPipBUo2Ip4/DDIRjrQsUNKINidyZ1xtjaZgrf7yj+VJy3jTzhhoGxw/PUKYkM
	AE9nzgeW/V6PPZzTdPplDmziJLuojALWQZhMyUfneujoGWSb6PfwxiQc1riiAL4NL4jx
	y6Bly8a09Z9psIV9g0dA1JO1yPAPNDFoyU0KJ95AQ4DS8pWYr7zQrmmdKRSPvFh1dxxx
	cqrLvJBozwAPU+JTsL8XwKEHJlQlFb8yL3nXlnrvBIZFENCPhkDjYqd7ARPcLXJxaANo
	EiUA==
X-Received: by 10.58.111.163 with SMTP id ij3mr1843574veb.26.1396294830225;
	Mon, 31 Mar 2014 12:40:30 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Mon, 31 Mar 2014 12:39:50 -0700 (PDT)
In-Reply-To: <22ec9615b07180f5dbf66109b9e1da5ac2cff8a0.1396288310.git.bruce.ashfield@windriver.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>
	<22ec9615b07180f5dbf66109b9e1da5ac2cff8a0.1396288310.git.bruce.ashfield@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 31 Mar 2014 20:39:50 +0100
X-Google-Sender-Auth: oW9ScykvQNFsEd6pD1PS1RQ93n4
Message-ID: <CANyK_8d1KLFkTKm+P4Q5+2N=iLtmpFMcWcMr+V8r-u5g-2axEw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] linux-yocto/3.14: introduce versioned recipes
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
X-List-Received-Date: Mon, 31 Mar 2014 19:40:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 31 March 2014 18:56, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> The release kernel for Yocto 1.5 is the 3.14 kernel, so we introduce
> the versioned recipes here.
>

Should this say Yocto 1.6?

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

