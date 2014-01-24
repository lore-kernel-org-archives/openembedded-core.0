Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id CA69560E7C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:46:15 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id h16so3118581oag.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=wr+A6H2K45j8oQz8/0D/mGT9O/eE1QjBn4XQ1SkJrjg=;
	b=hJiijFef0O9vA6HBTrqck1JwfzwPdue/nXzs6egMGcpQR+ejHatQ/Agy1cbiu4Kc2S
	aJwOGHLaCdbLLmuBHt5XbFvtMt+zQrWKLi3j8aZ2mhYotKAjGqmrZAgbumWPsPTgof0m
	QEC0xnHkVqJX5/OoeNz4+UGblxkeUqWgVKflflG0lJ8zUWKtWdy7mATWIbmjYt7CqOgy
	ck22TKfrChngS+3O1e1EBS8wNkXGDa7FFO+UBS4EhxpyOByRghlFuVuJsMIko8k7wM3Z
	T8LjRlGMhksYZPErHzZRFBrMO7UYt9GXVMjA4sdR6UV/ep5JnKq1vGkqWr6xiL302Roc
	1Npg==
MIME-Version: 1.0
X-Received: by 10.182.84.132 with SMTP id z4mr9978272oby.49.1390527976572;
	Thu, 23 Jan 2014 17:46:16 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 17:46:16 -0800 (PST)
In-Reply-To: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
References: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
Date: Thu, 23 Jan 2014 23:46:16 -0200
X-Google-Sender-Auth: ako2VyIthztKMcg7PnJluhzQQWw
Message-ID: <CAP9ODKq7g-VRdie+6XyT1sxfc8KmkFgnKHKgV2=_3RoSmYArCg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-fsl-arm][PATCH v3 00/11] Freescale 3.10.17-1.0.0-beta - part 1
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
X-List-Received-Date: Fri, 24 Jan 2014 01:46:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Thu, Jan 23, 2014 at 11:26 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> I did some small fixes that I found during test at O.S. Systems'
> autobuilder and I dropped some fixes that were pushed to master (as
> you've probably noticed from the e-mail to the mailing list).
>
> I am awaiting people's feedback for the patches as this upgrades
> package versions and we should have a better test coverage.
>
> Please give a try in the 'master-next' branch and comment in anything
> that could be improved in the patches. All comments are welcome...

Sorry, I ended sending it to this mailing list by mistake.

I will send it to the proper mailing list...

Sorry for the noise...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

