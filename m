Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id F0C0B65DB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:30:45 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 131so4482813ykp.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=M1mRx5i0bLTipMtmipnERE5wjBgdyIMkb9ReYwR9glM=;
	b=QbXRP85LXS5cvl2tqP7TGxCiyOrq0qdygA3O6vFhboyUQjPysY9mE8EhnADuFPsWfz
	OJ29LYGQp0WHBZJvR/3agnMtR8V9wa899ePLX+48QK32T1T4vtabdAimGXLrVP4u4Ur7
	Q/2PWEUGWhk9Bsx/PVAFD3KrUh6kzlXxzfo/9Fi0faWzSDmSE7ESfSpYKavLcYT4JRjp
	jqEE58uGSCcM5C8LKmAwd3K2HUqRRlZlL/ClVgRevnipJ1IhttLlvjY2CAyvP/epiH6x
	oNCsPm4QrMk0lJMp7BrtLCEJJ19X+LLlyL1hbngH+8SkSPgbEbSsnvHoXRkTEu4Vsy0I
	exfg==
MIME-Version: 1.0
X-Received: by 10.236.79.230 with SMTP id i66mr8350396yhe.136.1407180645072;
	Mon, 04 Aug 2014 12:30:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 12:30:45 -0700 (PDT)
In-Reply-To: <d358027b2a45a24ce326fb34499b16ef9fb896a5.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<d358027b2a45a24ce326fb34499b16ef9fb896a5.1407177403.git.ben.shelton@ni.com>
Date: Mon, 4 Aug 2014 16:30:45 -0300
X-Google-Sender-Auth: f5aahlfZkSBGZW0U4GSBryuEW48
Message-ID: <CAP9ODKpeg+N0oq-iVFXLgvznZN+S+RJzF1fa_NTuYvXK5goLvQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/20] udev-cache: Honor VERBOSE for bootup message
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
X-List-Received-Date: Mon, 04 Aug 2014 19:30:46 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 3:40 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58620
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

