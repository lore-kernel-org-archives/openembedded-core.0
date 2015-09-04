Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8526577016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 16:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t84GWio1010147; Fri, 4 Sep 2015 17:32:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VeAUrxX5i45F; Fri,  4 Sep 2015 17:32:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t84GWSUs010142
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 4 Sep 2015 17:32:40 +0100
Message-ID: <1441384348.24871.192.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 04 Sep 2015 17:32:28 +0100
In-Reply-To: <CAJTo0LbzGw_ZZ5BpYxCQremnk82bJ6RDNMwjag1qRELkENit8w@mail.gmail.com>
References: <cover.1441336912.git.peter.seebach@windriver.com>
	<709779e96e115ed29b9ab7d0e9ba9fba38c584e7.1441336912.git.peter.seebach@windriver.com>
	<CAJTo0LbzGw_ZZ5BpYxCQremnk82bJ6RDNMwjag1qRELkENit8w@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.7.2.bb: New version of pseudo
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
X-List-Received-Date: Fri, 04 Sep 2015 16:32:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-09-04 at 14:19 +0100, Burton, Ross wrote:
> On 4 September 2015 at 04:28, Peter Seebach
> <peter.seebach@windriver.com> wrote:
>         +SRC_URI = " \
>         +
>         http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2 \
>
> ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
> http://downloads.yoctoproject.org/releases/pseudo/pseudo-1.7.2.tar.bz2:
> 2015-09-04 14:11:21 ERROR 404: Not Found.
>
> There isn't a 1.7.2 tarball uploaded yet.

There is now...

Cheers,

Richard



