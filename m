Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 702A875545
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 11:35:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9CBZnUk003777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Oct 2018 12:35:50 +0100
Message-ID: <245af0f16d3498094cd8fd085385809abdd9d67d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, rui.wang@windriver.com
Date: Fri, 12 Oct 2018 12:35:48 +0100
In-Reply-To: <CAJTo0LYw+QsCYT1FjAVtFEYZ3f1qS50vbowudmQs5whS2qn7hA@mail.gmail.com>
References: <1539312696-151975-1-git-send-email-rui.wang@windriver.com>
	<CAJTo0LYw+QsCYT1FjAVtFEYZ3f1qS50vbowudmQs5whS2qn7hA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] attr: fix utime for symlink
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
X-List-Received-Date: Fri, 12 Oct 2018 11:35:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-10-12 at 12:12 +0100, Burton, Ross wrote:
> Please change the shortlog to say that the patch is to unfs3 and not
> attr.

I tweaked it in master-next to say that and added a commit message
description.

Cheers,

Richard


