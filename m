Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 983B861EEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 17:17:06 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id 16so8293690obc.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 10:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=5CHq+SUfQSwgEGjnFg6bu9p9uEU/Iwm7Rye0znR4dOg=;
	b=cKWGRDSicd3oSP1/zQMHDAbskgszxG+pO7bu4TP/B+ldU4xg4u3+gCPwSxiWZlCLF8
	Ui5U59yKUuUyEUzog1rNKGEyaChqJ0iOuA1MiUqh+DMKOVGVEdAAf65jxxXpU3JffV6l
	vNI02MZTMq4rha3ZhZgBU9IS6vm8TX7bFcdD0mhsZAHJLCR4NyVgEbdVfOO7u9pRpuFs
	xUj9SzEOZ1Ar2JEWZzJoikbdUEF/v9wfzktKsFPUZnF0+FgMu2ekMVgpmJMaE3CDiCYj
	c3Wdgc9TOOHH52CWHYZ65grYEePu3tSoAu/Dt+7sByKx5R3BVkmeZ3DqwoMf+FCK8vvH
	Ijuw==
MIME-Version: 1.0
X-Received: by 10.182.118.129 with SMTP id km1mr21464510obb.15.1374513426868; 
	Mon, 22 Jul 2013 10:17:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Mon, 22 Jul 2013 10:17:06 -0700 (PDT)
In-Reply-To: <cover.1374511663.git.sgw@linux.intel.com>
References: <cover.1374511663.git.sgw@linux.intel.com>
Date: Mon, 22 Jul 2013 14:17:06 -0300
X-Google-Sender-Auth: K6KTQ7Pa4OLMSEbOhxbkFqbZa_8
Message-ID: <CAP9ODKrgfGdO7uBhS1LoqmkpTHpLb+YkbvfeoqZ5OjZ6kHtRtg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Zhenhua Luo <zhenhua.luo@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/27] Ready for Pull after final ACK
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
X-List-Received-Date: Mon, 22 Jul 2013 17:17:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 22, 2013 at 2:12 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Richard,
>
> This has been trimmed and reviewed, please wait for Paul and Ross (traveling)
> final ACKs.
>
> ** Reminder to BSP Maintainers - Please update your mesa .bbappends ***
> ** I will send email when RP has pulled, please keep me posted on your branches **
>
> Thanks
>         Sau!

Once it is merged I update meta-fsl-arm.

Thanks for letting me know about it.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

