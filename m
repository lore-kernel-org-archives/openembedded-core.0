Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFFE610FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 12:42:32 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o17so2040824oag.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=NpsxgLwztNwr7w8eCG7BVI6KZjos7DbrafauHt7V8Gs=;
	b=X8EJsjkgK6aSnoARw0UlEj3N+5mjXv0+Wm8DmGMnUQW858b3WzunQ+QSL4j66gTvcm
	7KZUlA392ASzXRXeOMVntrI9ckuqXfBS+y8If+SQVhmF8aV1NvPXZIGsyuEwYYpumzZg
	QKJZIKT2IVzudVtWXzHhZTnYhnrd1teOnObBXoC9ygjfIlmxkJRqg8MZwIXKLLo4wuzG
	51O8r4GiyPCyLgrxr1W40Ru0AlIXpFoUFUBfHMrK5AOESoDXcf5c5TMXH1uzMbqQavns
	dU0V6lROWSnFDf2sp0gVhdejsNNNTSqyR8TRj0cTsvQqsdfwfqzxfldgvXH2XZCLJq5B
	KvCg==
MIME-Version: 1.0
X-Received: by 10.182.226.199 with SMTP id ru7mr25201801obc.12.1380026553384; 
	Tue, 24 Sep 2013 05:42:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 24 Sep 2013 05:42:33 -0700 (PDT)
In-Reply-To: <1380013034-2681-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
References: <1380013034-2681-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Date: Tue, 24 Sep 2013 09:42:33 -0300
X-Google-Sender-Auth: k8b1PajgxKxm_nRU4aBJ0MCdEZA
Message-ID: <CAP9ODKo--dRe-FvP=p8UukRn4tCRdPyLiNfm2bj2jKCrpPjZVg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wayland/weston: bump to 1.2.0 version
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
X-List-Received-Date: Tue, 24 Sep 2013 12:42:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 24, 2013 at 5:57 AM, Ewan LE BIDEAU-CANEVET
<Ewan.LEBIDEAU-CANEVET@eurogiciel.fr> wrote:
> add bitbake files for wayland and weston 1.2.0
>
> Signed-off-by: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
> ---

Your commit log say bump but in fact you add these.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

