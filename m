Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 95550712B1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Aug 2014 23:41:58 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id 9so2803630ykp.39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Aug 2014 16:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=0R3s10q0GJz9oO5SBBE9aVMmf8tTTRg+JWsC13b0rEY=;
	b=EWBhfZW1ixx7KXaMuXhlJMV/aJTstZsmX9pC6n1Xe5pszeoV/JsdYxdQ1/5RbkW6jQ
	Yy+GS3HEOTAxP4ce6zZb2xEMd2z0hpYHHhJnhvJy1RA5gL7IfE8VSn/IvcHQpvKJTPBN
	xG9pRGbfK2E/6eCSrz9/ezK0gUSKdCTgZa4khiAOJeCRoZWEJdMHVgFlshcKxEgC7am4
	YSn5yFOxa6pDPpr3FpXOlyjWBHxInLFFoS7X+YpvZqDJbDl9ElrRuruNY0CuCDfGdTz6
	5PfDR4nwqjTDh68g8vd/hnCqBGZH+QZmMtqAMlat4ujkxnIpxPRgd9yQD5IfXGreSmIA
	DqDg==
MIME-Version: 1.0
X-Received: by 10.236.160.225 with SMTP id u61mr37404170yhk.4.1409528519917;
	Sun, 31 Aug 2014 16:41:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Sun, 31 Aug 2014 16:41:59 -0700 (PDT)
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
Date: Sun, 31 Aug 2014 20:41:59 -0300
X-Google-Sender-Auth: Qym6wRLPRLs4RsFu0zB4wMnvAL4
Message-ID: <CAP9ODKq74ZabKZ=eL_Qo7OeuunrE5EeV_BNjeN=3wN70XO1_cQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/18] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Sun, 31 Aug 2014 23:42:07 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 30, 2014 at 1:38 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Here's the pending queue of kernel changes for the 1.7 feature freeze.
> The queue is large, but I've actually been building and running with
> most of these changes for 6 months now, so they've been soaked for
> quite a while.

Why waiting such long time to send them?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

