Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB716E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 13:27:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9PDRYIv013033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 25 Oct 2018 14:27:36 +0100
Message-ID: <e0a9aaa6204510e4e70d96d163d1a91e5c999a67.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Hoosier <matt.hoosier@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2018 14:27:34 +0100
In-Reply-To: <CAJgxT3_WUvjS5tfYSi7K-p0HmwL_ds-m+GHFDhBvrcobqU8fOw@mail.gmail.com>
References: <20181019160455.4606-1-matt.hoosier@gmail.com>
	<CAJgxT3_WUvjS5tfYSi7K-p0HmwL_ds-m+GHFDhBvrcobqU8fOw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] volatile-binds: use overlayfs if available
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
X-List-Received-Date: Thu, 25 Oct 2018 13:27:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-10-24 at 09:40 -0500, Matt Hoosier wrote:
> Hi; any interest in this one?

Yes, it merged!

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=c4acf1b531843497297c492456daea1744400faa

Cheers,

Richard


