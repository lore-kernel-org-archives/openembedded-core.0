Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TDnvl-0007rl-Md
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 04:52:57 +0200
Received: by pbcwy7 with SMTP id wy7so9862868pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 19:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=6OXaFYMbv9QHj33L/PabuFXanXImATGFm8UWs+yTm5U=;
	b=LRl7RZMlBTSg/THF2HPv+0ycvX+OT5Ln8eVzIU+ExZ1J5xo2MNl2PxDp4giV3gQVPr
	sWk6BxRQifOyybjufchNKfORzGwqgEaJvOlArRrCqIL+Of53K1Gg3k5fYAWsKaei+rk2
	Usd1OqNUsU6HQDqPh8KmlsL8+UqyBcoTpTdj8IoNR+7zZasL6uxq689vFH++zUx4qTw+
	pGpBrHCYEb5UApy/QUYO3WqrAQQz8hFR48ajJ9/XGlbUKV7dEcxwN/iscTX2LVRlZiJF
	CPzfFwMhkBspVLPdr29knHTzGu7+7TeCZoIMdvPp8R4dB3olJ6n6BL+ykF4WMHyXip1s
	AWDQ==
MIME-Version: 1.0
Received: by 10.66.78.194 with SMTP id d2mr23328943pax.42.1347936017525; Mon,
	17 Sep 2012 19:40:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Mon, 17 Sep 2012 19:40:17 -0700 (PDT)
In-Reply-To: <1347927458-21623-2-git-send-email-sgw@linux.intel.com>
References: <1347927458-21623-1-git-send-email-sgw@linux.intel.com>
	<1347927458-21623-2-git-send-email-sgw@linux.intel.com>
Date: Mon, 17 Sep 2012 23:40:17 -0300
X-Google-Sender-Auth: RbVwMM1ubaHKD8Z8S_m6vy5DV1o
Message-ID: <CAP9ODKrM9FxUgMm5-Di9B2q1AAg882hQLd+gvNpErpVFi=q+Yw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] xserver-xorg: Modify RREPLACES for RCONFLICTS
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
X-List-Received-Date: Tue, 18 Sep 2012 02:52:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Saul,

On Mon, Sep 17, 2012 at 9:17 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

I understand the patch but from the description it is not clear why it
is need. Please clarify it in the commit log.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


