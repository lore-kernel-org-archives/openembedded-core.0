Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 201B471B86;
	Tue,  2 Jan 2018 22:42:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w02MgKld004071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 2 Jan 2018 22:42:21 GMT
Message-ID: <1514932940.5525.98.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org, Kristian Amlie
	<kristian.amlie@northern.tech>
Date: Tue, 02 Jan 2018 22:42:20 +0000
In-Reply-To: <20180102191559.GA4180@localhost>
References: <151491408002.12536.9555639223209873731@git.openembedded.org>
	<20180102172800.BCD4523561F@git.openembedded.org>
	<20180102191559.GA4180@localhost>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 13/44: u-boot-fw-utils: Fix broken makefile in v2017.11.
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
X-List-Received-Date: Tue, 02 Jan 2018 22:42:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-01-02 at 20:15 +0100, Martin Jansa wrote:
> On Tue, Jan 02, 2018 at 05:28:13PM +0000, git@git.openembedded.org
> wrote:
> > 
> > This is an automated email from the git hooks/post-receive script.
> > 
> > rpurdie pushed a commit to branch master
> > in repository openembedded-core.
> Looks like older version of this patch was merged.
> 
> This version https://patchwork.openembedded.org/patch/146668/
> 
> adds the Upstream-Status from the commit message to the .patch file
> where it belongs.

Sorry, well spotted!

I've queued a fixup in master-next, thanks.

Richard

