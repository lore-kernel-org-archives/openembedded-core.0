Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id C395060842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:21:55 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id xn12so4122544obc.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5N8sPD/ysoHWPGUBG/EyOPatlXQRQGD/LFi8YPwoi0E=;
	b=QGJflyaW0ApOmcyeuozxAwOC/w4fYW+GZLilIpt8qdLs9EOC1AJnTRxuthWYodKdRk
	axe9tjymfbbwzWoB/WlUHtX9xOVJxDk4UPHHoJQL+LRyjEFJUrbQIBuNWmIFCu46ZtBX
	LGTd9l6O3B/LM25jRrVEgG+eiHRMfLZB5JhruO7eI+L2aLFfPb5taqHoUhI+HWHOShNs
	6hypCewk90Z4xVD1ZBYzZDWPobAOiwwAbzbNmYJTsL0pSTPxfv3S+TsV8JNGat9c2hUg
	cMYouLRwibGj1qUdkSOSzbqvxrMj2fOxVv4OPKF9qBMCrzLY90TQcvUxwzvccL70p1e7
	ZCQA==
MIME-Version: 1.0
X-Received: by 10.182.144.136 with SMTP id sm8mr15507599obb.63.1377192116052; 
	Thu, 22 Aug 2013 10:21:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 22 Aug 2013 10:21:55 -0700 (PDT)
In-Reply-To: <1377190468-15466-2-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1377190468-15466-1-git-send-email-lauren.post@freescale.com>
	<1377190468-15466-2-git-send-email-lauren.post@freescale.com>
Date: Thu, 22 Aug 2013 14:21:55 -0300
X-Google-Sender-Auth: n3YrJPF4lkz-FVg-KcTc5UpHMZE
Message-ID: <CAP9ODKqppuY7ZVB=eoKBMuwH210UBmXtBjdx8nzF-DEL_fQsOQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Lauren Post <lauren.post@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [v4][PATCH 2/2] directfb: Add fusion patch for hangs on exit
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
X-List-Received-Date: Thu, 22 Aug 2013 17:21:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 22, 2013 at 1:54 PM, Lauren Post <lauren.post@freescale.com> wrote:
> directfb: Add fusion patch for hangs on exit
>
> with following tests:   direct_test, fusion_skirmish
>
> Signed-off-by: Lauren Post <lauren.post@freescale.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

