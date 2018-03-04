Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 46C1C78A3F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 13:26:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w24DQorM015141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 4 Mar 2018 13:26:51 GMT
Message-ID: <1520170010.3436.66.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 04 Mar 2018 13:26:50 +0000
In-Reply-To: <CA+chaQeKutNQ5G8=6ph4fYZVJb8KkF0OWeExCJUQTWArBZirKA@mail.gmail.com>
References: <1520162580-30003-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CA+chaQeV1f7yUt3w5t7iXrYf5OyMjbxr-C_dqKGqG+jDt4gFcA@mail.gmail.com>
	<CA+chaQdU0RoRG_5pKr5qrKS2KauOfii_F-_CHPB4cy_0v2P-pQ@mail.gmail.com>
	<CA+chaQeKutNQ5G8=6ph4fYZVJb8KkF0OWeExCJUQTWArBZirKA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][pyro] gcc6: Upgrade to 6.4.0 (latest stable series release)
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
X-List-Received-Date: Sun, 04 Mar 2018 13:26:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-03-04 at 13:08 +0100, Martin Jansa wrote:
> And the same with
> meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-4490.patch
> which isn't included in SRC_URI since:

As far as I can tell this isn't included in the patch or the
repository?

Cheers,

Richard

