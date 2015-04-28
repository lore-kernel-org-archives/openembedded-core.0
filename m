Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBBA73D76
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 08:03:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 0F57460035F
Message-ID: <1430208222.2801.1.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 28 Apr 2015 09:03:42 +0100
In-Reply-To: <1430143463.13022.118.camel@linuxfoundation.org>
References: <1429613620-2989-1-git-send-email-Martin.Jansa@gmail.com>
	<20150427110426.GE2379@jama>
	<1430143463.13022.118.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.11 (3.12.11-1.fc21) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [fido][PATCH 1/4] elfutils: fix build with -Os
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
X-List-Received-Date: Tue, 28 Apr 2015 08:03:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-04-27 at 15:04 +0100, Richard Purdie wrote:
> On Mon, 2015-04-27 at 13:04 +0200, Martin Jansa wrote:
> > On Tue, Apr 21, 2015 at 12:53:37PM +0200, Martin Jansa wrote:
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > 
> > ping for all 4 changes
> 
> I had hoped the fido maintainer would look at this but evidently not.

Apologies, I had looked and even pulled the 3 changes from master into
my local testing branch but hadn't completed a test build yet. I shall
endeavour to respond more quickly in future.

> If you are going to propose patches which aren't in master, please
> mention that.

Yes, please do.

Cheers,

Joshua



