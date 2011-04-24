Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QE5bV-00072B-9H
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Apr 2011 22:08:25 +0200
Received: by yxn22 with SMTP id 22so517806yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2011 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=DCl9pxuVz5m7kF/nYDwmjeiOd33UG46b5w1QkzgQR44=;
	b=e4SZbDAgBZSHUgl0auXJCYNnPMUe5qDqcVYvxfRqv0T1lYb38mrtAfirEN25gx6+8d
	+ZIgWDqWnRBQxxTVfpcIkbV/uWkbvBgOLDwdLrBs8D8cXtgBc1zpVfdCu99iRFNOnhR4
	mntgDjFmY/Fb6KJVCMfj3P7ukE8UloLbBScl0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=R1lwmlhUDBk3ra/Y0I4moq/9pWysoOAHmvxAFSkmJkX174Wf5xvWjQvSBztjXLMhBF
	PfXroGfxe8NB8dh5updkOClpZz7d72rIjcZJvuMZZxL/jF+nU9TC2k6/2PZ7Vnyr38Wv
	jwVBWA6VKA9kFRhMgOfhzNz4VT8bfVOenO8X4=
MIME-Version: 1.0
Received: by 10.90.215.7 with SMTP id n7mr2779570agg.146.1303675550569; Sun,
	24 Apr 2011 13:05:50 -0700 (PDT)
Received: by 10.90.141.8 with HTTP; Sun, 24 Apr 2011 13:05:50 -0700 (PDT)
In-Reply-To: <BANLkTimoLw8aG6xm8zUgJXUfHRvJuqOdyA@mail.gmail.com>
References: <BANLkTimoLw8aG6xm8zUgJXUfHRvJuqOdyA@mail.gmail.com>
Date: Sun, 24 Apr 2011 22:05:50 +0200
Message-ID: <BANLkTikSwpDo9uUuz_6V9SB0zLinu1B2Lg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Perl 5.12.2 no more fetchable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Apr 2011 20:08:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/4/23 Khem Raj <raj.khem@gmail.com>

> Since the latest stable is 5.12.3 this mirror we use in SRC_URI has
> decided to dump 5.12.2 tarball. Either we upgrade to 5.12.3 or find  a
> mirror which still have 5.12.2 e.g.
> http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/perl-5.12.2.tar.gz
>
> Source is still at http://www.cpan.org/src/5.0/perl-5.12.2.tar.gz
This is a better location than www.cpan.org/src

Enjoy, Frans

