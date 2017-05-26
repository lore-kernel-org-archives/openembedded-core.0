Return-Path: <stefan.wiehler@missinglinkelectronics.com>
Received: from smtp.missinglinkelectronics.com
	(smtp.missinglinkelectronics.com [5.9.234.182])
	by mail.openembedded.org (Postfix) with ESMTP id 76A6378258
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 06:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id D10CFE0191
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 08:36:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id T1uc-Eoa45aB; Fri, 26 May 2017 08:36:26 +0200 (CEST)
Received: from [10.89.231.22] (p4FE1E831.dip0.t-ipconnect.de [79.225.232.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	(Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id 37BD7E017F;
	Fri, 26 May 2017 08:36:26 +0200 (CEST)
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <CAJ86T=ULob-3w572btu9UuVxDU1TxNc=jYNkfY7kewVCirxx8w@mail.gmail.com>
	<1493996466-26026-1-git-send-email-stefan.wiehler@missinglinkelectronics.com>
From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
Organization: Missing Link Electronics
Message-ID: <0e9c916b-6df2-54e5-8a27-fbc07e96f3e8@missinglinkelectronics.com>
Date: Fri, 26 May 2017 08:36:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1493996466-26026-1-git-send-email-stefan.wiehler@missinglinkelectronics.com>
Cc: Ulrich Langenbach <ulrich.langenbach@missinglinkelectronics.com>
Subject: Re: [PATCH] module.bbclass: Add devshell support
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
X-List-Received-Date: Fri, 26 May 2017 06:36:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

 > Adds development shell support for out-of-tree kernel modules by
 > reproducing the build environment of the compile task.
 >
 > Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
 > ---
 >
 > Change: Remove devshell task dependency
 >
 > …

Is there anything else preventing this from being merged?

