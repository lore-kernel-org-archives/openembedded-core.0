Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CA62D784DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 18:30:23 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1FIUMIN019308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Feb 2018 18:30:23 GMT
Message-ID: <1518719422.24236.164.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 15 Feb 2018 18:30:22 +0000
In-Reply-To: <7224a2768d18f72afc37cea4b47718510d54c8b7.1517798422.git.liezhi.yang@windriver.com>
References: <cover.1517798422.git.liezhi.yang@windriver.com>
	<7224a2768d18f72afc37cea4b47718510d54c8b7.1517798422.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 4/4] time: 1.7 -> 1.8
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
X-List-Received-Date: Thu, 15 Feb 2018 18:30:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-02-05 at 10:41 +0800, Robert Yang wrote:
> * Remove debian.patch which is already in the source.
> * The license is changed to GPLv3, I will add the v2 one
> (time_1.7.bb) to
>   meta-gplv2.

Could you point me at that patch please as we'll need to merge this at
the same time to avoid test failures.

Cheers,

Richard

