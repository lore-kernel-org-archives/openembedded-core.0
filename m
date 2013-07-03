Return-Path: <radu.moisan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 53FC561A45
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 08:14:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2013 01:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,986,1363158000"; 
	d="scan'208,217";a="364037739"
Received: from ubuntu.rb.intel.com (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2013 01:14:55 -0700
Message-ID: <51D3DDED.7060804@intel.com>
Date: Wed, 03 Jul 2013 11:16:45 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1369298825.git.cazfi74@gmail.com>
	<519EA042.1@linux.intel.com>
	<CAF6bG8c7v4eFuw+QfjaE3HDsooYm9XOexx2wXQuaAM2W0OzM_Q@mail.gmail.com>
In-Reply-To: <CAF6bG8c7v4eFuw+QfjaE3HDsooYm9XOexx2wXQuaAM2W0OzM_Q@mail.gmail.com>
Subject: Re: [PATCH 0/1] Update automake to version 1.13.2
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
X-List-Received-Date: Wed, 03 Jul 2013 08:14:55 -0000
Content-Type: multipart/alternative;
	boundary="------------040000090808070806010206"

--------------040000090808070806010206
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 05/25/2013 01:21 AM, Marko Lindqvist wrote:
>
>  Confirmed. Automake update to (any) 1.13.x version breaks gtk-engines 
> build. I don't know yet if it's automake or gtk-engines bug.
>

Any updates on this? Do we have a bug filled addressing this problem? I 
found several package which require automake 1.13.x for upgrade and this 
automake issue is blocking them.

Radu

--------------040000090808070806010206
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 05/25/2013 01:21 AM, Marko Lindqvist
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAF6bG8c7v4eFuw+QfjaE3HDsooYm9XOexx2wXQuaAM2W0OzM_Q@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div dir="ltr">
        <div><br>
        </div>
        &nbsp;Confirmed. Automake update to (any) 1.13.x version breaks
        gtk-engines build. I don't know yet if it's automake or
        gtk-engines bug.<br>
        <div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Any updates on this? Do we have a bug filled addressing this
    problem? I found several package which require automake 1.13.x for
    upgrade and this automake issue is blocking them.<br>
    <br>
    Radu<br>
  </body>
</html>

--------------040000090808070806010206--
