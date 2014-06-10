Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 61AA765D32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 11:07:01 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 61D5E2232CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 13:06:59 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BC0632232CBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 13:06:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 13:06:58 +0200 (CEST)
Date: Tue, 10 Jun 2014 13:06:53 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20140610110646.GB28607@mail.itconsulting-heinold.de>
References: <1402348889-26065-1-git-send-email-henning@itconsulting-heinold.de>
	<1402348889-26065-3-git-send-email-henning@itconsulting-heinold.de>
	<CADkTA4NZ5gepMbUgTf1F8isyCkd0FMTVWyq11HVUZWrY=V5F5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NZ5gepMbUgTf1F8isyCkd0FMTVWyq11HVUZWrY=V5F5Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH 2/3] perf: fix broken shell comparsion in do_install
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
X-List-Received-Date: Tue, 10 Jun 2014 11:07:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 09, 2014 at 08:35:06PM -0400, Bruce Ashfield wrote:
> When describing something as broken in the short log, it's typically a good
> idea to also include the symptoms, and the fix. That way the log will tell
> someone experience a particular problem that this change indeed addresses
> their problem.
> 
> Bruce

Hi Bruce,

there was no error shown, the build succeeded always. I stumbled over it
by reading the bb file.

Bye Henning

