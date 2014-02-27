Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 09CEC6DE07
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:19:30 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gf5so1694974lab.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 06:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=HIGTvAVLVKPuOtCXibnuQ/HF/Y2rjhyWmO1wMMw2C38=;
	b=SUkbRs6gfBAp3q+428008QsxbK9ctjpG5cST7S66nl4Gz8mJhKY+hWPbI7R4twvjhl
	EWy6DAhn/wBSMRq4nA0JmgL/lr/1k+mP/vIbx4i+8jgj/fVf7O6HCBLnRIemxFXYBNPX
	qs4dzHXfoVOzhxdJ3joD86s+7QImNP4lpnYiJ+7gSPfqMQA4GSiInbh58iIiW57TPM6s
	P9+YJb1EU4csxYZMdE8R5Of8br24tJdjtNO0pdERdvDI4vmfWvYftjYlawMPlhVHSSBx
	ioYj9ZmC4ToiEXOjyuJWfJOBbd/5EUfkecdWRiY28xUK4U0P48UK2DnkUE7ixqcCo7iA
	yC3A==
X-Received: by 10.112.137.137 with SMTP id qi9mr6501016lbb.36.1393510770054;
	Thu, 27 Feb 2014 06:19:30 -0800 (PST)
Received: from [172.16.141.133] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id 7sm6515269lav.5.2014.02.27.06.19.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 06:19:28 -0800 (PST)
Message-ID: <530F496A.4010300@gmail.com>
Date: Thu, 27 Feb 2014 15:19:22 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1393509895-6236-1-git-send-email-david.nystrom@enea.com>
In-Reply-To: <1393509895-6236-1-git-send-email-david.nystrom@enea.com>
Subject: Re: [RFC][PATCH] Attempt to unify predefined package feed handling
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
X-List-Received-Date: Thu, 27 Feb 2014 14:19:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2014-02-27 15:04, David Nyström wrote:
> local.conf defines
> PACKAGE_FEED_URIS = "http://www.feed_repo.org/repo/"
>
> should we do it this way or some other way ?
>
> [Bug 5407]
>
>
>

Oops,
Duplicate, please comment on the other thread.


