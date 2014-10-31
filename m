Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-04.prod.phx3.secureserver.net
	(p3plsmtpa08-04.prod.phx3.secureserver.net [173.201.193.105])
	by mail.openembedded.org (Postfix) with ESMTP id DFFAA60557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 10:05:39 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-04.prod.phx3.secureserver.net with 
	id 9m5d1p00B0BVjqb01m5eJG; Fri, 31 Oct 2014 03:05:39 -0700
Message-ID: <54535EF1.20202@pabigot.com>
Date: Fri, 31 Oct 2014 05:05:37 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: preferred remotes for git pulls?
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
X-List-Received-Date: Fri, 31 Oct 2014 10:05:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

There are two changes (virtual/bluez and pseudo-no-host-passwd) that I'd 
like to rework and propose for master now that it's reopened.  Both are 
likely to touch multiple files.  Previous comments and the wiki how-to 
suggest that git-pull is preferred over patchwork-only for multi-patch 
changes like this.

I have existing github resources that I could use as the source. Would 
that be acceptable to the maintainers?

If using an openembedded-hosted -contrib repository is preferred, what's 
the process for getting access?  I'd be touching openembedded-core and 
meta-openembedded at the least.

Peter

