Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TdIuW-0003i5-3j
	for Openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 12:01:04 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 563B5D22C0; Tue, 27 Nov 2012 11:47:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 74108D2218;
	Tue, 27 Nov 2012 11:46:32 +0100 (CET)
Message-ID: <50B499FB.7080505@linaro.org>
Date: Tue, 27 Nov 2012 11:46:19 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
References: <1354011889-18394-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1354011889-18394-1-git-send-email-eric@eukrea.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] subversion: update to 1.7.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 11:01:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

W dniu 27.11.2012 11:24, Eric B=C3=A9nard pisze:
> - fix WARNING: Failed to fetch URL http://www.apache.org/dist/subversio=
n/subversion-1.7.6.tar.bz2
> - subversion-1.7.6_mod_dontdothat_svnserve_only.patch doesn't seems to =
be useful,
>   cc Marcin to get confirmation
>=20
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

As long as it builds I am fine. 1.7.6 required that patch to get built.



