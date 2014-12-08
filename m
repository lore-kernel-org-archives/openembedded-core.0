Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id CF042724A5;
	Mon,  8 Dec 2014 12:04:40 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id 29so2396174yhl.41
	for <multiple recipients>; Mon, 08 Dec 2014 04:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=6i8zUpRJJVgOFq7CSTY6UuT5EmjCkTeeSPt2to7IO5Q=;
	b=cflIjHiLbmTKOGdvH2RFtWZubUftookf8Kp1rbhvWR02D5DSmUnSRME5SY6kVttMVc
	pPJF+wsClOJ3LNq7PS+05RjaWD94xih5b3fwfLlSnli4yoHyopn5MExZ0sGutKCrKDLI
	5at6M1Lh/l6SI4IyqBZt0RVCxJ0UVZ+HXNsrleEURpljvoXKFcXJKw/IN3jXCuNi4a19
	OQp7SOL/TDLhrtTH7ljlkp+OPRuQ7Ho2ODQSocX9YnmP8Sd9y7HWzRQDBA0PCXMr+nBG
	Qlvli3Uqi3PEkDwHP2iuHiRT7z8GRjRVmkPbOYKtBcsDs9arteY8WRbivko9jZyJMDPE
	Gw+Q==
MIME-Version: 1.0
X-Received: by 10.236.66.72 with SMTP id g48mr720675yhd.37.1418040280712; Mon,
	08 Dec 2014 04:04:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Mon, 8 Dec 2014 04:04:40 -0800 (PST)
In-Reply-To: <548558E5.7030706@gmail.com>
References: <548558E5.7030706@gmail.com>
Date: Mon, 8 Dec 2014 10:04:40 -0200
X-Google-Sender-Auth: W7bCHUsygrQruXjUX54smE_TThM
Message-ID: <CAP9ODKqLhH4BsfztgiTMMehpXb6yJ+ZyNKydN1dYj+6mwGDJ6A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta globus (grid toolkit)
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
X-List-Received-Date: Mon, 08 Dec 2014 12:04:43 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 8, 2014 at 5:53 AM, akuster808 <akuster808@gmail.com> wrote:
> Is anyone working on adding Globus toolkit as a meta layer? I started on one
> and have several packages building. It is a bit rough.
>
> It is located at https://github.com/akuster/meta-globus

Nice!

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

