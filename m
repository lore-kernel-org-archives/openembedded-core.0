Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id BE03373DBA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 10:59:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 09721600198
Message-ID: <1430477949.3318.10.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 01 May 2015 11:59:09 +0100
In-Reply-To: <1430477850.18360.11.camel@linuxfoundation.org>
References: <[OE-core][PATCH] systemd: remove unused patches>
	<1430476889-5490-1-git-send-email-joshua.lock@collabora.co.uk>
	<1430477339.3318.6.camel@collabora.co.uk>
	<1430477850.18360.11.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.1 (3.16.1-1.fc22) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: remove unused patches
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
X-List-Received-Date: Fri, 01 May 2015 10:59:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-01 at 11:57 +0100, Richard Purdie wrote:
> On Fri, 2015-05-01 at 11:48 +0100, Joshua Lock wrote:
> > On Fri, 2015-05-01 at 11:41 +0100, Joshua Lock wrote:
> > > These patches are no longer required since 
> > > 7bfc9891ff498bdde31aadd2449d3b4692dbc510
> > 
> > Ah, I see Ross has submitted a patch to re-add the Make-root-s-home
> > -directory-configurable.patch
> > 
> > Possibly ignore this?
> 
> I've actually been hoping someone would send this cleanup. I dropped 
> the
> problematic part of the patch and queued it.
> 

Brilliant, thanks. I'll pull it into fido-next once it has landed in
master.

Cheers,

Joshua

