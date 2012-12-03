Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TfY63-0005nz-G8
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 16:38:15 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 03 Dec 2012 07:23:52 -0800
Received: by mail-ob0-f197.google.com with SMTP id v19so12315739obq.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 07:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=LuPUfTBD5fOZ5h2Y4fcdeudiGqdpH2X+741Ek3hdIkw=;
	b=gZmIRuO7eCYLpjFj8QQV3pH4OAHlYeyzhGgWf8LeKfdHhyvxGsMOe7HwEftaBnfNQ+
	8AageCHWZT/3cbxExO6JTZzbiZiz4uH4Km6cpY82NsWVgidSiXsAUW24w+VTEb0smsEK
	sDk0JgJm7XFh3d1psREjHqLIq0cEx5OYpbAzyM4/Kjp6L4aVePEgbuulWcAHvTjts9Z2
	AJMi0JNagIUZvTrpj6c3IfmsXwWpu+ZDfvzt2JlGNqgn6CThjP1wvTyG3Y7dsV1EiW1W
	dA7rSBP+t0pcdUyjLLNwRLcSHX0Tb54PZ4w+sPerScQtQsgPOZtEEpAoFejN/Kf9ZTjy
	NjeQ==
Received: by 10.182.48.69 with SMTP id j5mr4593490obn.17.1354548231870;
	Mon, 03 Dec 2012 07:23:51 -0800 (PST)
Received: by 10.182.48.69 with SMTP id j5mr4593485obn.17.1354548231771; Mon,
	03 Dec 2012 07:23:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Mon, 3 Dec 2012 07:23:31 -0800 (PST)
In-Reply-To: <20121203151331.GD3354@jama.jama.net>
References: <20121112132247.3BB7D102EC@opal>
	<20121203151331.GD3354@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Dec 2012 15:23:31 +0000
Message-ID: <CAJTo0LZvTpbSs-bO2Ov-oxqZnhg1uPTdmsD2PU0t_uM1rFkHQw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQl92SAdGU16QDQt1RKLka3eQBv1K19UB4NKQzHhza6Yivviaav05V5cLk9Kro/RgxduQZFp/ab/adxLgWztiuwhGachGa24gb4VlFRPJUjrPMYfnbwJQ8jzQTLvcF21Fu8T0ISbYVE/kWOBtDxNFzIidqNDod6MiFBz3LBwMmIYYHK4lEHXu7HrG2VOj0GlWxxvYH/P
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : glib-2.0: upgrade to latest stable, 2.34.1.
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
X-List-Received-Date: Mon, 03 Dec 2012 15:38:15 -0000
Content-Type: text/plain; charset=UTF-8

On 3 December 2012 15:13, Martin Jansa <martin.jansa@gmail.com> wrote:
> [-Werror=deprecated-declarations]

I wish people wouldn't use that.

Sure.

Ross


