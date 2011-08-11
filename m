Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QraJq-0000fu-Km
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 20:49:27 +0200
Received: by vwe42 with SMTP id 42so711050vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 11:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=+lBkyFfcf9ApKGbi9BMSFvl2mADbkXz0+UAfbuXtdXI=;
	b=QPgrutDVyhKEXM1puQlqnesoOZNlYjBYEc0GkhE/s/Xgx0pg6VE9lEWH2aN52ElkNI
	uBxlfRfjY3CBAJCkkbNKEmdCJucZZ9voFPn4k1cvtuqjpTit83hcuNERa6NByzEpCU9H
	tUKRE0xirtHao03LJd8JhtmIKnEbPpNYBfiZw=
Received: by 10.52.117.101 with SMTP id kd5mr6768328vdb.364.1313088294187;
	Thu, 11 Aug 2011 11:44:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.112.194 with HTTP; Thu, 11 Aug 2011 11:44:34 -0700 (PDT)
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
From: Chris Larson <kergoth@gmail.com>
Date: Thu, 11 Aug 2011 11:44:34 -0700
Message-ID: <CABcZAN=BMqLMJ9Wk94KvhLYyHJpDRnG2vew9a1qwF29G-K_m8Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/7] Miscellaneous fixes
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
X-List-Received-Date: Thu, 11 Aug 2011 18:49:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2011 at 11:23 AM, Christopher Larson <kergoth@gmail.com> wr=
ote:
>
> are available in the git repository at:
> =C2=A0github:kergoth/oe-core misc-fixes

Erm, forgot to adjust this before sending, the url is
git://github.com/kergoth/oe-core (I use url insteadOf/pushInsteadOf in
.gitconfig to use the above url).
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


