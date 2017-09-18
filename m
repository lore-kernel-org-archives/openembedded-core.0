Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id 94A9A78062
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 23:18:48 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 2F45E2ADC93;
	Mon, 18 Sep 2017 18:18:49 -0500 (CDT)
Date: Mon, 18 Sep 2017 18:18:47 -0500
From: Seebs <seebs@seebs.net>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20170918181847.594b6943@seebsdell>
In-Reply-To: <CAHUNapTtXFnCurGoVtWKL=7v7Spxj4Hg2JqGh530ktRGgVgOyg@mail.gmail.com>
References: <20170918133410.31388-1-alexander.kanavin@linux.intel.com>
	<CAHUNapTtXFnCurGoVtWKL=7v7Spxj4Hg2JqGh530ktRGgVgOyg@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] pseudo: use epoll API on Linux
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
X-List-Received-Date: Mon, 18 Sep 2017 23:18:48 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 Sep 2017 19:16:13 -0400
Trevor Woerner <twoerner@gmail.com> wrote:

> It doesn't make sense to carry these large patches against pseudo in
> OE itself. Isn't pseudo one of the tools under The Yocto Project
> umbrella?

Yes. But the pool of people with the variety of expertise needed to
maintain it isn't huge, and *normally* I'm more responsive, I'm just
extra busy the last couple of months.

-s

