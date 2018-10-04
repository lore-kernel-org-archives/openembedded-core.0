Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 17699789FF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 22:02:42 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w94M2fpE005414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 4 Oct 2018 23:02:42 +0100
Message-ID: <1ff9c0ececb825b383c89508e5033cf0f94e3f1b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Angelo Dureghello <angelo@sysam.it>,
	openembedded-core@lists.openembedded.org
Date: Thu, 04 Oct 2018 23:02:41 +0100
In-Reply-To: <20181004132953.3568-4-angelo@sysam.it>
References: <20181004132953.3568-1-angelo@sysam.it>
	<20181004132953.3568-4-angelo@sysam.it>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 3/4] conf/machine/include: add m68k architecture definitions
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
X-List-Received-Date: Thu, 04 Oct 2018 22:02:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-04 at 15:29 +0200, Angelo Dureghello wrote:
> Signed-off-by: Angelo Dureghello <angelo@sysam.it>
> ---
>  meta/conf/machine/include/m68k/README        | 9 +++++++++
>  meta/conf/machine/include/m68k/arch-m68k.inc | 8 ++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 meta/conf/machine/include/m68k/README
>  create mode 100644 meta/conf/machine/include/m68k/arch-m68k.inc

I'm going to queue these even though its late in the cycle. I removed
the README from the patch though since I didn't think it was adding
much value.

Cheers,

Richard

